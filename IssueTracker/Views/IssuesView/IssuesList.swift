//
//  IssuesList.swift
//  IssueTracker
//
//  Created by Djallil Elkebir on 2021-09-14.
//

import SwiftUI

struct IssuesList: View {
    @Binding var project: Project
    let columns = [
            GridItem(.adaptive(minimum: 100)),
            GridItem(.adaptive(minimum: 100))
        ]
    var body: some View {
        ZStack {
            VStack{
            ForEach(Priority.allCases, id:\.self){priority in
                    PriorityListIssue(priority: priority, project: $project)
            }
            }
            if project.issues.isEmpty{
                NavigationLink(destination: AddIssueView(project: $project)){
                IssueListEmptyViewLabel()
                }
            }
        }
    }
}

struct IssuesList_Previews: PreviewProvider {
    static var project = Project(id: UUID().uuidString, title: "Project", description: "", issues: Issue.issues, startDate: Date(), endDate: Date(), isOpen: true, team: [])
    static var previews: some View {
        IssuesList(project: .constant(project))
    }
}

struct PriorityListIssue: View {
    let priority: Priority
    @Binding var project: Project
    var body: some View {
        if !project.issues.filter({$0.priority == priority}).isEmpty {
            IssueListPriority(priority: priority, project: $project)
        }
    }
}

struct IssueListEmptyViewLabel: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(lineWidth: 2)
                .foregroundColor(.accentColor)
                VStack {
                    Image(systemName: "plus.rectangle")
                        .padding()
                    Text("Add your first issue")
                        .font(.headline)
                        .bold()
                    .foregroundColor(.accentColor)
                }
        }.padding()
            .frame(width: 200, height: 200)
    }
}
