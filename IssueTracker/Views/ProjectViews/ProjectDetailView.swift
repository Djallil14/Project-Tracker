//
//  ProjectDetailView.swift
//  IssueTracker
//
//  Created by Djallil Elkebir on 2021-09-20.
//

import SwiftUI

struct ProjectDetailView: View {
    @ObservedObject var projectStore: ProjectStore
    @Binding var project: Project
    @State private var showAddIssueSheet: Bool = false
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment:.center, spacing: 8){
                    Text(project.description)
                        .font(.caption)
                        .italic()
                        .foregroundColor(.secondary)
                    Text("Team:").font(.headline)
                    ForEach(project.team){employee in
                        Text("\(employee.name) \(employee.role.description)")
                            .font(.subheadline)
                        
                    }.padding(8)
                    IssuesList(project: $project)
                    HStack {
                        Spacer()
                        Button(action: {showAddIssueSheet.toggle()
                            projectStore.addIssues(project)
                        }){
                            HStack {
                                Image(systemName: "plus")
                                Text("Add issue")
                            }
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }.navigationTitle(project.title)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink(destination:EditProjects(projectStore: projectStore, project: $project)){
                            Image(systemName: "slider.vertical.3")
                                .padding(8)
                                .foregroundColor(.white)
                                .background(Color.accentColor)
                                .clipShape(Circle())
                        }
                    }
                }
        }
    }
}

struct ProjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ProjectDetailView(projectStore: ProjectStore(),project:.constant(Project.sampleProject))
        }
    }
}
