//
//  HomeView.swift
//  HydroLog
//
//  Created by Rudhra T on 3/10/2026.
//

import Foundation

struct WaterDataManager {
    static let shared = WaterDataManager()
    private let storageKey = "dailyWaterLogs"
    
    static func dateKey(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
    
    func getLogs() -> [String: Double] {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let logs = try? JSONDecoder().decode([String: Double].self, from: data) else {
            return [:]
        }
        return logs
    }
    
    func saveWater(_ amount: Double, for date: Date = Date()) {
        var logs = getLogs()
        let key = Self.dateKey(for: date)
        logs[key] = amount
        
        if let encoded = try? JSONEncoder().encode(logs) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }
}
