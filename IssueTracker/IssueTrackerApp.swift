//
//  IssueTrackerApp.swift
//  IssueTracker
//
//  Created by Djallil Elkebir on 2021-09-14.
//

import SwiftUI

@main
struct IssueTrackerApp: App {
    init(){
        UITableView.appearance().backgroundColor = .clear
        UINavigationBar.appearance().backgroundColor = UIColor(Color.background)
        UITextView.appearance().backgroundColor = .clear
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
