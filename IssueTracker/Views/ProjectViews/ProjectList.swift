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
                        NavigationLink(destination: AddProject(projectStore: projectStore)){
                            ProjectListEmptyViewLabel(projectStore: projectStore)
                        }
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
}

struct ProjectList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ProjectList(projectStore: ProjectStore())
        }
    }
}

struct ProjectListEmptyViewLabel: View {
    @ObservedObject var projectStore: ProjectStore
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(lineWidth: 2)
                .foregroundColor(.accentColor)
                VStack {
                    Image(systemName: "plus.rectangle")
                        .padding()
                    Text("Add your first project")
                        .font(.headline)
                        .bold()
                    .foregroundColor(.accentColor)
                }
        }.padding()
            .frame(width: 200, height: 200)
    }
}
