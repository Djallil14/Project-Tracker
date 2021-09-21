//
//  ContentView.swift
//  IssueTracker
//
//  Created by Djallil Elkebir on 2021-09-14.
//

import SwiftUI

struct MainView: View {
    @StateObject var projectStore = ProjectStore()
    var body: some View {
        TabView{
            ProjectList(projectStore: projectStore)
                .tabItem{
                    Label("Open", systemImage: "lock.open")
                }
            ClosedProjectList(projectStore: projectStore)
                .tabItem{
                    Label("Closed", systemImage: "lock")
                }
            Text("Settings")
                .tabItem{
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
