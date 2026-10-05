//
//  Notifications.swift
//  HydroLog
//
//  Created by Rudhra T on 3/10/2026.
//

import Foundation
import UserNotifications

final class Notifications: NSObject, UNUserNotificationCenterDelegate {
    static let shared = Notifications()
    
    private override init() {
        super.init()
        // Sets the delegate so notifications can present while the app is in the foreground
        UNUserNotificationCenter.current().delegate = self
    }
    
    func requestAndScheduleNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                self.scheduleDailyReminder()
                self.scheduleGoodNightGreeting()
            } else if let error = error {
                print("Notification authorization error: \(error.localizedDescription)")
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

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error adding daily reminder: \(error.localizedDescription)")
            }
        }
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
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error adding good night greeting: \(error.localizedDescription)")
            }
        }
    }

    // Displays notification banners even when the app is open on screen
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.banner, .sound])
    }
}
