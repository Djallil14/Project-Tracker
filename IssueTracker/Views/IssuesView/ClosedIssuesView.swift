//
//  ClosedIssuesView.swift
//  IssueTracker
//
//  Created by Djallil Elkebir on 2021-09-15.
//

import SwiftUI

struct ClosedIssuesView: View {
    @Binding var project: Project
    var body: some View {
        NavigationView{
            ZStack{
                Color.background.edgesIgnoringSafeArea(.all)
                VStack{
                    IssuesList(project: $project)
                }
            }.navigationTitle("Closed")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action:{}){
                        Image(systemName: "plus")
                        }
                    }
                }
        }
    }
}

struct ClosedIssuesView_Previews: PreviewProvider {
    static var previews: some View {
        ClosedIssuesView(project: .constant(Project.sampleProject))
    }
}
