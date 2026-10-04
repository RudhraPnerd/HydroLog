//
//  Notifications.swift
//  HydroLog
//
//  Created by Rudhra T on 3/10/2026.
//

import Foundation
import UserNotifications

struct Notifications {
    static let shared = Notifications()
    
    private init() {}
    
    func requestAndScheduleNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                // Schedules both notifications forever
                scheduleDailyReminder()
                scheduleGoodNightGreeting()
            }
        }
    }
    
    func scheduleDailyReminder() {
        let content = UNMutableNotificationContent()
        content.title = "Time to Hydrate!"
        content.body = "Don't forget to log your water intake into HydroLog"
        content.sound = .default
        
        var dateComponents = DateComponents()
        dateComponents.hour = 12
        dateComponents.minute = 0
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "daily_water_reminder", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }
    
    func scheduleGoodNightGreeting() {
        let content = UNMutableNotificationContent()
        content.title = "Good Night!"
        content.body = "See you tomorrow! If you reached your goal, good job! If not, try to drink more tomorrow"
        content.sound = .default
        
        var dateComponents = DateComponents()
        dateComponents.hour = 20
        dateComponents.minute = 0
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "daily_good_night_greeting", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
