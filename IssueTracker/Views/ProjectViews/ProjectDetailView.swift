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
    @State private var showingClosedProject = false
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment:.leading, spacing: 8){
                    Text(project.description)
                        .font(.caption)
                        .italic()
                        .foregroundColor(.secondary)
                        .padding()
                    Text("Team:").font(.headline)
                        .padding(8)
                    ForEach(project.team){employee in
                        HStack{
                            Spacer()
                            Text(employee.name)
                                .font(.subheadline)
                            Spacer()
                            Text(employee.role.description)
                                .font(.headline)
                            Spacer()
                        }
                        
                    }.padding(8)
                    IssuesList(project: $project)
                    Spacer()
                    HStack {
                        Spacer()
                        VStack{
                            NavigationLink(destination: AddIssueView(project: $project)){
                                HStack {
                                    Image(systemName: "plus")
                                    Text("Add issue")
                                }.font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.accentColor)
                                    .cornerRadius(12)
                            }
                            if !showingClosedProject{
                                Button(action:{projectStore.closeProject(project)}){
                                    Text("Close Project")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.red)
                                        .cornerRadius(12)
                                }
                            } else {
                                Button(action:{projectStore.openProject(project)}){
                                    Text("Open Project")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.green)
                                        .cornerRadius(12)
                                }
                            }
                        }
                        Spacer()
                    }
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
    static var project = Project(id: UUID().uuidString, title: "Project", description: "", issues: Issue.issues, startDate: Date(), endDate: Date(), isOpen: true, team: [])
    static var previews: some View {
        NavigationView{
            ProjectDetailView(projectStore: ProjectStore(),project:.constant(project))
        }
    }
}
