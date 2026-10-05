//
//  ContentView.swift
//  HydroLog
//
//  Created by Rudhra T on 1/10/2026.
//

import SwiftUI


struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(1)
            
            CalendarHistoryView()
                .tabItem {
                    Label("History", systemImage: "calendar")
                }
                .tag(2)
            
            AboutView()
                .tabItem{
                    Label("About", systemImage: "info.circle.fill")
                }
                .tag(3)
        }
        .tint(.cyan)
    }
}
