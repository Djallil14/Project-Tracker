//
//  DetailIssueView.swift
//  IssueTracker
//
//  Created by Djallil Elkebir on 2021-09-15.
//

import SwiftUI

struct DetailIssueView: View {
    let project: Project
    @Binding var issue: Issue
    @State var longDescription: String = ""
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            Form{
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
                    }
                }
                TextField("",text:$issue.shortDescription)
                    .font(.caption)
                    .padding()
                    .foregroundColor(.secondary)
                    .listRowBackground(Color.accentColor.opacity(0.1))
                TextEditor(text: $longDescription)
                    .padding()
                    .listRowBackground(Color.accentColor.opacity(0.1))
                    .frame(minHeight: 200)
            }
        }.navigationTitle(issue.title)
            .onAppear{
                if let longDescription = issue.longDescription {
                    self.longDescription = longDescription
                }
            }
            .onDisappear{
                if let _ = issue.longDescription { issue.longDescription = self.longDescription
                }
            }
    }
}

struct DetailIssueView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailIssueView(project: Project.sampleProject, issue: .constant(Issue.issues[8]))
        }
    }
}
