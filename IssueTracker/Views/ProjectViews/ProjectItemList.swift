//
//  ProjectItemList.swift
//  IssueTracker
//
//  Created by Djallil Elkebir on 2021-09-16.
//

import SwiftUI

struct ProjectItemList: View {
    let project: Project
    let color: Color
    var body: some View {
        VStack(alignment:.center) {
            HStack {
                Spacer()
                Text(project.title)
                    .font(.title2).bold()
                .padding(8)
                Spacer()
            }
            HStack(spacing: 4) {
                Spacer()
                Text("Starting date:").font(.subheadline)
                Text(project.startDate, style: .date)
                    .font(.headline)
                Spacer()
            }
            HStack(spacing: 4) {
                Spacer()
                Text("Closing date:").font(.subheadline)
                Text(project.endDate, style: .date)
                    .font(.headline)
                Spacer()
            }
            VStack{
                Text("Issues :").font(.headline)
                    .padding(8)
                HStack{
                    smallIssueBadges(.urgent)
                    smallIssueBadges(.high)
                    smallIssueBadges(.medium)
                }
                HStack{
                    smallIssueBadges(.low)
                    smallIssueBadges(.veryLow)
                    smallIssueBadges(.closed)
                }
            }
            
        }.padding()
            .background(color.opacity(0.8))
            .foregroundColor(.white)
        .cornerRadius(18)
    }
    private func smallIssueBadges(_ priority: Priority)-> some View {
        return Text("\(project.issues.filter({$0.priority == priority}).count)")
            .font(.subheadline).bold()
            .padding()
            .frame(minWidth: 54, minHeight: 54)
            .background(priority.color)
            .clipShape(Circle())
            .shadow(color: priority.color.opacity(0.2), radius: 2, x: 1, y: 2)
    }
}

struct ProjectItemList_Previews: PreviewProvider {
    static var previews: some View {
        ProjectItemList(project: Project.sampleProject, color: .blue)
    }
}
