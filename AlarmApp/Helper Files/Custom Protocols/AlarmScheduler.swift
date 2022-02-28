//
//  AlarmScheduler.swift
//  AlarmApp
//
//  Created by Mehdi MMS on 28/02/2022.
//

import Foundation
import UserNotifications

protocol AlarmScheduler: class {
    func scheduleUserNotification(for alarm: Alarm)
    func cancelUserNotification(for alarm: Alarm)
}

extension AlarmScheduler {
    /**
     Schedules a User Notification

     - Parameters:
        - alarm: The `alarm` to use when scheduling the User Notification

     */
    func scheduleUserNotification(for alarm: Alarm){

        let content = UNMutableNotificationContent()
        /// Set the title for the User Notification
        content.title = "Time to get up"
        /// Set the body for the User Notification
        content.body = "Your alarm named \(alarm.title!) is going off!"
        /// Set the sound for the User Notification.
        content.sound = UNNotificationSound.default

        let components = Calendar.current.dateComponents([.month, .day, .year, .hour, .minute, .second], from: alarm.fireDate!)
        /// Creates the trigger for the User notification. We create our `DateComponents` using the current time from our `alarm.fireDate`.
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        /// Create the request. Note that we are using the `UUID` from the alarm. This is how we are identifying what `Alarm` object to trigger.
        let request = UNNotificationRequest(identifier: alarm.uuidString!, content: content, trigger: trigger)
        /// Add it all together
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error{
                print("Error scheduling local user notifications \(error.localizedDescription)  :  \(error)")
            }
        }
    }
    /**
     Cancels a User Notification

     - Parameters:
        - alarm: The `alarm` to use when canceling the User Notification

     */
    func cancelUserNotification(for alarm: Alarm){
        /// Canceling the User Notification. Note we use the `UUID` from the `alarm` to identify the User Notification to cancel. This can take in an array of alarms, but we will only give it one at at time.
        guard let id = alarm.uuidString else { return }
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
    }
}

