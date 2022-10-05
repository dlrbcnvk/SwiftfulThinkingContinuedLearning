//
//  LocalNotificationBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 조성규 on 2022/10/02.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    static let shared = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "THis is my first notification!"
        content.subtitle = "This was sooo easy!"
        content.sound = .default
//        content.badge = 1
        
        let badge = UIApplication.shared.applicationIconBadgeNumber
        content.badge = (badge + 1) as NSNumber
        
        // time
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // calendar
//        var dateComponents = DateComponents()
//        dateComponents.hour = 9
//        dateComponents.minute = 36
//        dateComponents.weekday = 1
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // location
        let coordinates = CLLocationCoordinate2D(latitude: 40, longitude: 50)
        // which like a coffee store
        let region = CLCircularRegion(center: coordinates, radius: 100, identifier: UUID().uuidString)
        region.notifyOnEntry = true
        region.notifyOnExit = false
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct LocalNotificationBootcamp: View {
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Request permossion") {
                NotificationManager.shared.requestAuthorization()
            }
            
            Button("Schedule notification") {
                NotificationManager.shared.scheduleNotification()
            }
        }
        .onChange(of: scenePhase) { newPhase in
            switch newPhase {
            case .active:
                UIApplication.shared.applicationIconBadgeNumber = 0
                break
            case .background:
                print("background")
            case .inactive:
                print("inactive")
            }
        }
        
    }
}

struct LocalNotificationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationBootcamp()
    }
}
