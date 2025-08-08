//
//  NotificationName+Extension.swift
//  LMFeedUI
//
//  Created by Pushpendra Singh on 21/05/23.
//

import Foundation

extension Notification.Name {
    static let postCreationCompleted = Notification.Name("Post creation completed")
    static let postCreationStarted = Notification.Name("Post creation started")
    static let postEditCompleted = Notification.Name("Post edit completed")
    static let postEditStarted = Notification.Name("Post edit started")
    static let refreshHomeFeedData = Notification.Name("Refresh home feed data")
    static let refreshHomeFeedDataObject = Notification.Name("Refresh home feed data Object")
    static let errorInApi = Notification.Name("errorInApi")
}
