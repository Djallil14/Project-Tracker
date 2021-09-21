//
//  ProjectList.swift
//  IssueTracker
//
//  Created by Djallil Elkebir on 2021-09-16.
//

import SwiftUI

struct ClosedProjectList: View {
    @ObservedObject var projectStore: ProjectStore
    let columns = [
        GridItem(.adaptive(minimum: 200))
    ]
    var body: some View {
        NavigationView{
            ZStack {
                Color.background.edgesIgnoringSafeArea(.all)
                ScrollView(.vertical){
                    LazyVGrid(columns:columns){
                        ForEach($projectStore.closedProjects){$project in
                            NavigationLink(destination: ProjectDetailView(projectStore: projectStore, project: $project)){
                                ProjectItemList(project: project, color:.secondary).padding()
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }.navigationTitle("Closed Projects")
                .navigationBarTitleDisplayMode(.inline)
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ClosedProjectList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ClosedProjectList(projectStore: ProjectStore())
        }
    }
}
