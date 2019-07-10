//
//  UNMutableNotificationContent+extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 10/07/19.
//  
//  
//

#if os(iOS)
import Foundation
import UserNotifications

@available(iOS 10.0, *)
extension UNMutableNotificationContent {
    
    static func initialize(
        title: String,
        body: String,
        badge: NSNumber? = nil,
        sound: UNNotificationSound = .default,
        userInfo: [AnyHashable: Any] = [:]
        ) -> UNMutableNotificationContent {
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.badge = badge
        content.sound = sound
        content.userInfo = userInfo
        return content
    }
    
}

#endif
