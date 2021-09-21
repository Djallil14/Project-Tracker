//
//  ProjectStore.swift
//  IssueTracker
//
//  Created by Djallil Elkebir on 2021-09-20.
//

import Foundation

class ProjectStore: ObservableObject {
    @Published var projects: [Project] = []
    @Published var closedProjects: [Project] = []
    
    func addProject(_ project: Project){
        projects.append(project)
    }
    func editOpenProject(_ editedProject: Project){
        var indexToEdit = 0
        for index in 0..<projects.count {
            if projects[index].id == editedProject.id {
                indexToEdit = index
            }
        }
        projects[indexToEdit] = editedProject
    }
    func addIssues(_ project: Project){
        for index in 0..<projects.count {
            if projects[index].id == project.id {
                projects[index].issues = Issue.issues
            }
        }
    }
}
