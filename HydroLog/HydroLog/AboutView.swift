//
//  AboutView.swift
//  HydroLog
//
//  Created by Rudhra T on 5/10/2026.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    
                    // App Header Card
                    VStack(spacing: 12) {
                        Image(systemName: "drop.fill")
                            .font(.system(size: 60))
                            .foregroundStyle(.cyan)
                            .padding()
                            .background(.ultraThinMaterial, in: Circle())
                            .shadow(color: .cyan.opacity(0.3), radius: 10, x: 0, y: 5)
                        
                        Text("HydroLog")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                        
                        Text("Version 1.0.0 (Beta)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(.ultraThinMaterial, in: Capsule())
                    }
                    .padding(.top, 20)
                    
                    // App Description Card
                    VStack(alignment: .leading, spacing: 12) {
                        Text("About the App")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                        
                        Text("HydroLog is designed to help you build healthy hydration habits effortlessly. Track your daily water intake, keep your goal streaks alive, and stay motivated with smart reminders.")
                            .font(.body)
                            .lineSpacing(4)
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 24))
                    .padding(.horizontal)
                    
                    // Key Features List
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Key Features")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                        
                        FeatureRow(icon: "chart.bar.fill", color: .cyan, title: "Smart Progress Tracking", description: "Monitor your percentage and daily intake in real-time.")
                        
                        FeatureRow(icon: "flame.fill", color: .orange, title: "Streak Counter", description: "Celebrate milestones every time you hit your target.")
                        
                        FeatureRow(icon: "bell.badge.fill", color: .blue, title: "Dual Daily Reminders", description: "Stay on top of your goals with morning and night notifications.")
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 24))
                    .padding(.horizontal)
                    
                    // Links Card
                    VStack(spacing: 12) {
                        Link(destination: URL(string: "https://github.com")!) {
                            HStack {
                                Label("GitHub Repository", systemImage: "code.typescript")
                                Spacer()
                                Image(systemName: "arrow.up.right")
                                    .font(.footnote)
                            }
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .padding()
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
                        }
                    }
                    .padding(.horizontal)
                    
                    // Footer Copyright
                    Text("Designed & Developed by Rudhra T\nMade with SwiftUI")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                        .padding(.top, 8)
                }
                .padding(.bottom, 32)
            }
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Helper Row View for Features
struct FeatureRow: View {
    let icon: String
    let color: Color
    let title: String
    let description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
                .frame(width: 32)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                
                Text(description)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    AboutView()
}
