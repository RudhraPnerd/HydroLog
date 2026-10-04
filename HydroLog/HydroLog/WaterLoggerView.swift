//
//  WaterLoggerView.swift
//  HydroLog
//
//  Created by Rudhra T on 3/10/2026.
//

import SwiftUI

struct WaterLoggerView: View {
    @AppStorage("loggedWater") private var water: Double = 0
    @State private var newLoggedWater: Double = 0
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("How much water did you drink?")
                    
                    Slider(value: $newLoggedWater, in: 0...500, step: 0.5) {
                        Text("Millilitres")
                    } minimumValueLabel: {
                        Text("0ml")
                    } maximumValueLabel: {
                        Text("500ml")
                    }
                    .tint(.cyan)
                    
                    // Displays the amount selected on the slider
                    Text("Selected: \(Int(newLoggedWater)) ml")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Log Water")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        // 1. Add the slider value to the existing total
                        water += newLoggedWater
                        
                        // 2. Persist the updated total
                        WaterDataManager.shared.saveWater(water)
                        
                        // 3. Close the sheet
                        dismiss()
                    }
                }
            }
        }
    }
}
