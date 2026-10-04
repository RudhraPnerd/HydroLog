//
//  CalendarView.swift
//  HydroLog
//
//  Created by Rudhra T on 3/10/2026.
//

//
//  CalendarHistoryView.swift
//  HydroLog
//
//  Created by Rudhra T on 1/10/2026.
//

import SwiftUI

struct CalendarHistoryView: View {
    @Environment(\.dismiss) private var dismiss
    
    // Reads and updates dynamic daily goal from UserDefaults
    @AppStorage("dailyGoal") private var dailyGoal: Int = 2000
    
    @State private var selectedDate: Date = Date()
    @State private var dailyLogs: [String: Double] = [:]
    
    private var selectedWater: Double {
        let key = WaterDataManager.dateKey(for: selectedDate)
        return dailyLogs[key] ?? 0
    }
    
    private var percentage: Double {
        guard dailyGoal > 0 else { return 0 }
        return min((selectedWater / Double(dailyGoal)) * 100, 100)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                // Graphical Calendar Picker
                DatePicker(
                    "Select Date",
                    selection: $selectedDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .padding()
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
                
                // Selected Day Summary Card
                VStack(spacing: 12) {
                    Text(selectedDate.formatted(date: .complete, time: .omitted))
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    
                    Text("\(Int(selectedWater)) / \(dailyGoal) ml")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundStyle(.primary)
                    
                    // Fixed parameter casing: value & total
                    ProgressView(
                        Value: min(selectedWater, Double(dailyGoal)),
                        Total: Double(max(dailyGoal, 1))
                    )
                    .tint(.cyan)
                    
                    Text("\(Int(percentage))% of daily goal reached")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(24)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 24))
                
                Spacer()
            }
            .padding()
            .navigationTitle("Hydration History")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
            .onAppear {
                dailyLogs = WaterDataManager.shared.getLogs()
            }
        }
    }
}
