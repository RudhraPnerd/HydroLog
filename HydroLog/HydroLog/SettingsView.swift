//
//  SettingsView.swift
//  HydroLog
//
//  Created by Rudhra T on 1/10/2026.
//

import Foundation
import SwiftUI


struct SettingsView: View{
    var body: some View{
        NavigationStack{
            VStack{
                
                Spacer()
                
                List{
                    NavigationLink("Daily Goal"){
                        DailyGoalView()
                    }
                    
                    NavigationLink("Acheivements"){
                        StreaksView()
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}
