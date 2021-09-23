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
    @Published var tempTeam : [Employees] = []
    
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
    func closeProject(_ project: Project){
        
        projects.removeAll(where: {$0.id == project.id})
        var projectToEdit = project
        projectToEdit.issues = []
        project.issues.forEach({
            issue in
            var issueToAppend = issue
            issueToAppend.priority = .closed
            issueToAppend.isOpen = false
            projectToEdit.issues.append(issueToAppend)
        })
        closedProjects.append(projectToEdit)
    }
    func openProject(_ project: Project){
        var projectToOpen = project
        closedProjects.removeAll(where: {$0.id == project.id})
        projectToOpen.issues = []
        projectToOpen.issues.forEach({
            var issuesToAppend = $0
            issuesToAppend.isOpen = true
            issuesToAppend.priority = .medium
            projectToOpen.issues.append(issuesToAppend)
        })
        projects.append(projectToOpen)
    }
    func newEmployee(){
        tempTeam.append(Employees(name: "New Employee", role: .notDefined))
    }
}
