//
//  ProjectList.swift
//  IssueTracker
//
//  Created by Djallil Elkebir on 2021-09-16.
//

import SwiftUI

struct ProjectList: View {
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
                        ForEach($projectStore.projects){$project in
                            NavigationLink(destination: ProjectDetailView(projectStore: projectStore, project: $project)){
                                ProjectItemList(project: project, color: project.priority.color).padding()
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    if projectStore.projects.isEmpty{
                        ProjectListEmptyView(projectStore: projectStore)
                    }
                }.navigationTitle("Projects")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .navigationBarTrailing){
                            NavigationLink(destination: AddProject(projectStore: projectStore)){
                                Image(systemName: "plus")
                                    .imageScale(.large)
                                    .padding(12)
                                    .background(Color.accentColor)
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                            }
                        }
                    }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    private func projectColor(_ project: Project)->Color{
        
        return Color.high
    }
}

struct ProjectList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ProjectList(projectStore: ProjectStore())
        }
    }
}

struct ProjectListEmptyView: View {
    @ObservedObject var projectStore: ProjectStore
    var body: some View {
        VStack{
            Spacer()
            Text("Press on the plus button to add your first project")
            Spacer()
        }
    }
}
