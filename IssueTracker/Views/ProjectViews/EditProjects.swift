//
//  EditProjects.swift
//  IssueTracker
//
//  Created by Djallil Elkebir on 2021-09-20.
//

import SwiftUI

struct EditProjects: View {
    @ObservedObject var projectStore: ProjectStore
    @Binding var project: Project
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            VStack{
                Form{
                    AddEditProjectBasicTextField(text:$project.title)
                        .listRowBackground(Color.background)
                    AddEditProjectBasicTextEditor(text: $project.description)
                        .listRowBackground(Color.background)
                    DatePicker("Start Date", selection: $project.startDate)
                        .listRowBackground(Color.background)
                    DatePicker("End Date", selection: $project.endDate)
                        .listRowBackground(Color.background)
                    HStack{
                        Text("Employees")
                        Spacer()
                        Text("Roles")
                    }.font(.headline)
                        .padding(.vertical)
                        .listRowBackground(Color.background)
                    
                    ForEach($project.team){$employee in
                        HStack{
                            TextField(employee.name, text:$employee.name)
                                .disableAutocorrection(true)
                            Spacer()
                            Picker("", selection: $employee.role) {
                                ForEach(Employee.allCases, id: \.self) { role in
                                    Text(role.description)
                                        .tag(role)
                                }
                            }.pickerStyle(MenuPickerStyle())
                        }.padding()
                    }.listRowBackground(Color.background)
                    HStack {
                        Button(action: {project.team.append(Employees(name: "New Employee", role: .notDefined))}){
                            Label("Add new employee", systemImage: "plus.circle")
                                .imageScale(.large)
                        }.padding(8)
                        Spacer()
                    }.listRowBackground(Color.background)
                }
                HStack {
                    Spacer()
                    Button(action:{
                        projectStore.editOpenProject(project)
                    }){
                        Text("Edit").bold()
                            .padding()
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    Spacer()
                }.listRowBackground(Color.background)
                    .padding()
            }
        }.navigationTitle("Edit Project")
    }
}

struct EditProjects_Previews: PreviewProvider {
    static var previews: some View {
        EditProjects(projectStore: ProjectStore(), project: .constant(Project.sampleProject))
    }
}
