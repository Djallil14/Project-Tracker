//
//  IssueListRow.swift
//  IssueTracker
//
//  Created by Djallil Elkebir on 2021-09-14.
//

import SwiftUI

struct IssueListRow: View {
    let issue: Issue
    var body: some View {
        ZStack {
            VStack(alignment: .center){
                Text(issue.title)
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .primary.opacity(0.1), radius: 2, x: 1, y: 2)
                Text(issue.assignedTo.name)
                    .bold()
                    .foregroundColor(.white)
                Text(issue.shortDescription)
                    .italic()
                    .foregroundColor(.secondary)
                    .font(.caption)
                    .padding(8)
            }
            .padding()
            .background(ZStack {
                Color.white
                LinearGradient(colors: [issue.priority.color,issue.priority.color.opacity(0.9),issue.priority.color.opacity(0.6),issue.priority.color.opacity(0.3)], startPoint: .top, endPoint: .bottom)
                }
            )
            .cornerRadius(18)
            .shadow(color:issue.priority.color.opacity(0.2), radius: 3, x: 1, y: 2)
        }.padding(8)
    }
}

struct IssueListRow_Previews: PreviewProvider {
    static var previews: some View {
        IssueListRow(issue: Issue.issues[3])
    }
}
