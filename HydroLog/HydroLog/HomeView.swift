//
//  HomeView.swift
//  HydroLog
//
//  Created by Rudhra T on 1/10/2026.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("loggedWater") private var water: Double = 0
    @AppStorage("dailyGoal") private var dailyGoal: Int = 2000
    @AppStorage("dailyStreaks") private var streaks: Int = 0
    
    @State private var showResetAlert = false
    @State private var showGoalReached = false
    @State private var showWaterLogger = false

    // Computed property breaks down the math so the compiler doesn't time out
    private var progressPercentage: Int {
        let safeGoal = Double(max(dailyGoal, 1))
        let percentage = (water / safeGoal) * 100
        return Int(percentage)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                
                // Percentage Card
                VStack(spacing: 8) {
                    Text("Daily Progress")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    Text("\(progressPercentage)%")
                        .font(.system(size: 44, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                }
                .padding(.vertical, 24)
                .padding(.horizontal, 12)
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 24))
                .padding(.horizontal)
                
                Spacer()
                
                // Progress Bar
                ProgressView(
                    Value: min(max(water, 0), Double(dailyGoal)),
                    Total: Double(max(dailyGoal, 1))
                )
                .tint(.cyan)
                .padding(.horizontal)
                
                // Side-by-Side Cards
                HStack(spacing: 12) {
                    // Water Consumed Card
                    VStack(spacing: 8) {
                        Text("Water Consumed")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            
                        Text("\(Int(water)) ml")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)
                    }
                    .padding(.vertical, 24)
                    .padding(.horizontal, 12)
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 24))
                    
                    // Streaks Card
                    VStack(spacing: 8) {
                        Text("Goals Achieved")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        HStack(spacing: 4) {
                            Image(systemName: "flame.fill")
                                .foregroundColor(.orange)
                            Text("\(streaks)")
                                .foregroundColor(.primary)
                        }
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                    }
                    .padding(.vertical, 24)
                    .padding(.horizontal, 12)
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 24))
                }
                .padding(.horizontal)
                
                // Action Buttons
                HStack(spacing: 12) {
                    
                    // UNDO BUTTON
                    Button {
                        if water >= 250 {
                            water -= 250
                        } else {
                            water = 0
                        }
                        WaterDataManager.shared.saveWater(water)
                    } label: {
                        Label("Undo", systemImage: "arrow.uturn.backward.circle.fill")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(.orange)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30))
                    
                    // ADD WATER BUTTON (Opens WaterLoggerView Sheet)
                    // ADD WATER BUTTON
                    Button {
                        showWaterLogger = true
                    } label: {
                        Label("Add Water", systemImage: "drop.fill")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(.cyan)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30))
                    .sheet(isPresented: $showWaterLogger, onDismiss: {
                        // Check if goal was reached after closing the logger sheet
                        if water >= Double(dailyGoal) && !showGoalReached {
                            showGoalReached = true
                            streaks += 1
                        }
                    }) {
                        WaterLoggerView()
                    }
                    
                    // REMOVE / RESET BUTTON
                    Button {
                        showResetAlert = true
                    } label: {
                        Label("Reset", systemImage: "minus.circle.fill")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(.red)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30))
                    .alert("Reset Water Intake?", isPresented: $showResetAlert) {
                        Button("Reset All", role: .destructive) {
                            water = 0
                            WaterDataManager.shared.saveWater(0)
                            showGoalReached = false
                        }
                        Button("Cancel", role: .cancel) { }
                    } message: {
                        Text("This will set your logged water intake back to 0 ml.")
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Home")
            .onAppear {
                Notifications.shared.requestAndScheduleNotification()
                WaterDataManager.shared.saveWater(water)
            }
            .fullScreenCover(isPresented: $showGoalReached) {
                GoalReachedView(isPresented: $showGoalReached)
            }
        }
    }
}
