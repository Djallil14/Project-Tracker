//
//  IssueListPriority.swift
//  IssueTracker
//
//  Created by Djallil Elkebir on 2021-09-15.
//

import SwiftUI

struct IssueListPriority: View {
    let priority: Priority
    @Binding var project: Project
    let columns = [
            GridItem(.adaptive(minimum: 100)),
            GridItem(.adaptive(minimum: 100))
        ]
    var body: some View {
        VStack{
            TitlePriorityHeader(priority: priority)
                LazyVGrid(columns: columns){
                    ForEach($project.issues){$issue in
                        if issue.priority == priority {
                            NavigationLink(destination: DetailIssueView(project: project, issue: $issue)){
                            IssueListRow(issue: issue)
                            }
                        }
                }
            }
        }
    }
}

struct IssueListPriority_Previews: PreviewProvider {
    static var previews: some View {
        IssueListPriority(priority: .urgent, project:.constant(Project.sampleProject))
    }
}
struct TitlePriorityHeader: View {
    let priority: Priority
    var body: some View {
        switch priority {
        case .veryLow:
            HStack{
                Spacer()
                Text("Very Low")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(8)
            .background(Color.veryLow)
        case .low:
            HStack{
                Spacer()
                Text("Low")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(8)
            .background(Color.low)
        case .medium:
            HStack{
                Spacer()
                Text("Medium")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(8)
            .background(Color.medium)
        case .high:
            HStack{
                Spacer()
                Text("High")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(8)
            .background(Color.high)
        case .urgent:
            HStack{
                Spacer()
                Text("Urgent")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(8)
            .background(Color.urgent)
        case .closed:
            HStack{
                Spacer()
                Text("Closed")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(8)
            .background(Color.secondary)
        }
        
    }
}

