//
//  DailyGoalView.swift
//  HydroLog
//
//  Created by Rudhra T on 1/10/2026.
//

import Foundation
import SwiftUI

var globalDailyGoal: Double = 2000

struct DailyGoalView: View {
    @AppStorage("dailyGoal") private var dailyGoal: Double = globalDailyGoal

    private var goalBinding: Binding<Double> {
        Binding(
            get: { Double(dailyGoal) },
            set: { newValue in
                dailyGoal = Double(newValue)
                globalDailyGoal = Double(newValue)
            }
        )
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Here, you can change your goal of how much water you want or need to drink. Please try to drink as much water as possible to stay hydrated!")
                .font(.subheadline)
                .foregroundColor(.secondary)

            HStack {
                Text("Daily Goal")
                    .font(.headline)
                    .foregroundColor(.secondary)

                Spacer()

                Text("\(dailyGoal) ml")
                    .font(.title2.bold())
                    .foregroundColor(.accentColor)
            }

            Slider(value: goalBinding, in: 500...5000, step: 250) {
                Text("Daily Goal")
            } minimumValueLabel: {
                Text("500")
                    .font(.caption)
                    .foregroundColor(.secondary)
            } maximumValueLabel: {
                Text("5000")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
        }
        .navigationTitle("Daily Water Goal")
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
        .padding()
    }
}
