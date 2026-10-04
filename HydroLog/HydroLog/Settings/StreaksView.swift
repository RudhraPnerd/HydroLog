//
//  StreaksView.swift
//  HydroLog
//
//  Created by Rudhra T on 3/10/2026.
//

import SwiftUI

struct StreaksView: View {
    @AppStorage("dailyStreaks") private var streaks: Int = 0
    @State private var showResetAlert = false
    
    var body: some View {
        List {
            Section {
                // Streak Display Row
                HStack {
                    Label("Goal Acheivements", systemImage: "flame.fill")
                        .foregroundStyle(.orange)
                    Spacer()
                    Text("\(streaks) days")
                        .bold()
                        .foregroundStyle(.secondary)
                }
            }
            
            Section("Settings") {
                // Reset Button Row
                Button(role: .destructive) {
                    showResetAlert = true
                } label: {
                    Label("Clear All Goal Achievements", systemImage: "trash.fill")
                }
            }
        }
        .navigationTitle("Goal Acheivement")
        .alert("Reset Achievements?", isPresented: $showResetAlert) {
            Button("Reset All", role: .destructive) {
                streaks = 0
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("This will set your goal achievements back to 0.")
        }
    }
}
