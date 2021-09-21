//
//  AddIssueView.swift
//  IssueTracker
//
//  Created by Djallil Elkebir on 2021-09-21.
//

import SwiftUI

struct AddIssueView: View {

    @Binding var project: Project
    @State var issue: Issue = Issue(id: UUID(), title: "Issue Title", shortDescription: "A short description of your issue", longDescription: nil, assignedTo: Employees.employee, priority: .medium, isOpen: true)
    @State var longDescription: String = "Add your long description here"
    @State var addLongDescription: Bool = true
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            VStack {
                Form{
                    TextField("",text: $issue.title)
                        .listRowBackground(Color.background)
                    Section(header: Text("Prority:")){
                        Picker("Priority:", selection: $issue.priority){
                            ForEach(Priority.allCases, id:\.self){priority in
                                Text(priority.description)
                                    .bold()
                                    .foregroundColor(priority.color)
                            }
                        }.pickerStyle(MenuPickerStyle())
                            .listRowBackground(Color.accentColor.opacity(0.1))
                    }
                    Section(header: Text("Assigned to:")) {
                        ForEach(project.team){employee in
                            VStack{
                                Button(action:{
                                    withAnimation{
                                    issue.assignedTo = employee
                                }
                                }){
                                    HStack {
                                        Text(employee.name)
                                        Text(employee.role.description)
                                        if issue.assignedTo == employee {
                                            Image(systemName: "checkmark")
                                                .imageScale(.large)
                                                .foregroundColor(.accentColor)
                                        }
                                    }.font(.subheadline)
                                }
                            }
                        }.listRowBackground(Color.accentColor.opacity(0.1))
                    }
                    TextField("",text:$issue.shortDescription)
                        .font(.caption)
                        .padding()
                        .foregroundColor(.secondary)
                        .listRowBackground(Color.accentColor.opacity(0.1))
                    Button(action:{withAnimation(.easeInOut){addLongDescription.toggle()}}){
                        HStack {
                            Text(!addLongDescription ? "Add long description" : "Remove long description")
                                .bold()
                            Image(systemName:addLongDescription ? "minus.circle" : "plus.circle")
                        }
                    }.listRowBackground(Color.accentColor.opacity(0.1))
                    if addLongDescription {
                        TextEditor(text: $longDescription)
                            .font(.caption)
                            .listRowBackground(Color.accentColor.opacity(0.1))
                            .frame(minHeight: 100)
                    }
                }
                Spacer()
                HStack {
                    Spacer()
                    Button(action:{
                        withAnimation{
                            if addLongDescription{
                            issue.longDescription = longDescription
                            }
                            project.issues.append(issue)
                        }
                    }){
                        Text("Add New Issue")
                            .bold()
                            .padding()
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    Spacer()
                }
            }
        }.navigationTitle(issue.title)
    }
}

struct AddIssueView_Previews: PreviewProvider {
    static var previews: some View {
        AddIssueView(project: .constant(Project.sampleProject))
    }
}
