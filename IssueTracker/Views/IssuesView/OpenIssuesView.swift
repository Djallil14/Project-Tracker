//
//  HomeView.swift
//  IssueTracker
//
//  Created by Djallil Elkebir on 2021-09-14.
//

import SwiftUI

struct OpenIssuesView: View {
    @Binding var project: Project
    var body: some View {
        NavigationView{
            ZStack{
                Color.background.edgesIgnoringSafeArea(.all)
                VStack{
                    IssuesList(project: $project)
                }
            }.navigationTitle("Open")
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        OpenIssuesView(project: .constant(Project.sampleProject))
    }
}
