//
//  Issue.swift
//  IssueTracker
//
//  Created by Djallil Elkebir on 2021-09-14.
//

import Foundation
import SwiftUI
import CoreText

struct Issue: Identifiable {
    var id = UUID()
    var title: String
    var shortDescription: String
    var longDescription: String?
    var assignedTo: Employees
    var priority: Priority
    var isOpen: Bool
}


enum Priority: Int, CaseIterable, Comparable {
    case urgent = 4
    case high = 3
    case medium = 2
    case low = 1
    case veryLow = 0
    case closed = -1
    
    static func < (lhs: Priority, rhs: Priority) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
        var description: String {
            switch self {
            case .urgent:
                return "Urgent"
            case .high:
                return "High"
            case .medium:
                return "Medium"
            case .low:
                return "Low"
            case .veryLow:
                return "Very Low"
            
           
            
            
            case .closed:
                return "Closed"
        }
    }
    
    static func randomPriority()-> Priority{
        let priorities: [Priority] = [.veryLow,.low,.medium,.high,.urgent]
        return priorities.randomElement()!
    }
    var color: Color {
        switch self {
        case .veryLow:
            return Color.veryLow
        case .low:
            return Color.low
        case .medium:
            return Color.medium
        case .high:
            return Color.high
        case .urgent:
            return Color.urgent
        case .closed:
            return Color.secondary
        }
    }
}

extension Issue {
    static var issues: [Issue] {
        var someIssues: [Issue] = []
            for i in 0...26 {
                let issue = Issue(title: "Bug Number \(i)", shortDescription: shortDescription,longDescription: longDescription, assignedTo: Employees.employee, priority: Priority.randomPriority(), isOpen: true)
                someIssues.append(issue)
            }
        for i in 0...26 {
            let issue = Issue(title: "Bug Number \(i)", shortDescription: shortDescription , assignedTo: Employees.employee, priority: .closed, isOpen: false)
            someIssues.append(issue)
        }
        return someIssues.sorted(by: {$0.priority > $1.priority})
    }
    static var shortDescription = "This is a short description describing the bug that need to be fixed"
    static var longDescription: String = "This is a short description describing the bug that need to be fixed,This is a short description describing the bug that need to be fixed"
}
