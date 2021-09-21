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
            ForEach(Priority.allCases, id:\.self){priority in
                PriorityListIssue(priority: priority, project: $project)
            }
    }
}

struct IssuesList_Previews: PreviewProvider {
    static var previews: some View {
        IssuesList(project: .constant(Project.sampleProject))
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

