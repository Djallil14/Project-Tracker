//
//  AddProject.swift
//  IssueTracker
//
//  Created by Djallil Elkebir on 2021-09-20.
//

import SwiftUI

struct AddProject: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var projectStore: ProjectStore
    @State var title: String = ""
    @State var description: String = "Project Description"
    @State var startDate = Date()
    @State var endDate = Date()
    @State var team: [Employees] = []
    @State var employeeName: String = ""
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            VStack {
                Form {
                    AddEditProjectBasicTextField(text: $title)
                        .listRowBackground(Color.background)
                    AddEditProjectBasicTextEditor(text: $description)
                        .listRowBackground(Color.background)
                    DatePicker("Start Date", selection: $startDate)
                        .listRowBackground(Color.background)
                    DatePicker("End Date", selection: $endDate)
                        .listRowBackground(Color.background)
                    
                        HStack{
                            Text("Employees")
                            Spacer()
                            Text("Roles")
                        }.font(.headline)
                            .padding(.vertical)
                            .listRowBackground(Color.background)
                    
                    ForEach($projectStore.tempTeam){$employee in
                            HStack{
                                TextField("", text: $employee.name)
                                    .disableAutocorrection(true)
                                    .tag(employee.id)
                                Picker("", selection: $employee.role) {
                                ForEach(Employee.allCases, id: \.self) { role in
                                        Text(role.description)
                                        .tag(role)
                                    }
                                }.pickerStyle(MenuPickerStyle())
                                
                            }.padding()
                        }.listRowBackground(Color.background)
                    HStack {
                        Button(action: {projectStore.newEmployee()}){
                            Label("Add new employee", systemImage: "plus.circle")
                                .imageScale(.large)
                        }.padding(8)
                        Spacer()
                    }.listRowBackground(Color.background)
                }.listStyle(InsetListStyle())
                    .navigationTitle("Add Project")
                HStack {
                    Spacer()
                    Button(action:{
                        withAnimation{
                            projectStore.addProject(Project(id: UUID().uuidString, title: title, description: description, issues: [], startDate: startDate, endDate: endDate, isOpen: true, team: projectStore.tempTeam))
                            presentation.wrappedValue.dismiss()
                        }
                    }){
                        Text("Done").bold()
                            .padding()
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    Spacer()
                }.listRowBackground(Color.background)
                    .padding()
            }
        }
    }
}

struct AddProject_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddProject(projectStore: ProjectStore())
        }
    }
}

struct AddEditProjectBasicTextField: View {
    @Binding var text: String
    var body: some View {
        TextField("Project Title", text: $text)
            .disableAutocorrection(true)
            .padding()
            .background(Color.background)
    }
}

struct AddEditProjectBasicTextEditor: View {
    @Binding var text: String
    
    var body: some View {
        TextEditor(text: $text)
            .padding()
            .background(Color.background)
            .frame(minHeight: 120)
    }
}
