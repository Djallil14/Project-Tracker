//
//  Project.swift
//  IssueTracker
//
//  Created by Djallil Elkebir on 2021-09-16.
//

import Foundation

struct Project: Identifiable {
    var id: String
    var title: String
    var description: String
    var issues: [Issue]
    var startDate: Date
    var endDate: Date
    var isOpen: Bool
    var team: [Employees]
    var priority: Priority {
        if isOpen == false {
            return .closed
        } else {
            if endDate == Date() {
                return .high
            } else if endDate < Date() {
                return .urgent
            } else if endDate > Date().addingTimeInterval(2628000) {
                return .veryLow
            }else if endDate > Date().addingTimeInterval(604800){
                return .low
            } else if endDate > Date() {
                return .medium
            }
        }
        return .closed
    }
}

enum Employee: CaseIterable, Hashable {
    case manager
    case developer
    case projectManager
    case designer
    case notDefined
    var description: String {
        switch self {
        case .manager:
            return "Manager"
        case .developer:
            return "Developer"
        case .projectManager:
            return "Project Manager"
        case .designer:
            return "Designer"
        case .notDefined:
            return "Undefined"
        }
    }
}

struct Employees: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var role: Employee
    
    static let employee: Employees = Employees(name: "John Doe", role: .manager)
}

extension Project {
    static let sampleProject: Project = Project(id: UUID().uuidString,title: "Project Name",description: "Add a short text to describe your project",issues: [], startDate: Date(), endDate: Date(), isOpen: true, team: [Employees.employee])
    static var sampleProjects: [Project] {
        var projects: [Project] = []
        for i in 0...20 {
            projects.append(Project(id: UUID().uuidString,title: "Project \(i)",description: Project.shortDescription,issues: Issue.issues, startDate: Date(), endDate: Date(), isOpen: Bool.random(), team: [Employees.employee]))
        }
        return projects
    }
    static var shortDescription = "This is a short description describing the Project that you are handeling"
    static var longDescription: String = "This is a short description describing the bug that need to be fixed,This is a short description describing the bug that need to be fixed,This is a short description describing the bug that need to be fixed,This is a short description describing the bug that need to be fixed,This is a short description describing the bug that need to be fixed,This is a short description describing the bug that need to be fixed,This is a short description describing the bug that need to be fixed,This is a short description describing the bug that need to be fixed,This is a short description describing the bug that need to be fixed"
}
