//
//  Date+Extension.swift
//  LMFeedUI
//
//  Created by Pushpendra Singh on 29/03/23.
//

import Foundation

extension Date {
    
    var millisecondsSince1970: Double {
        return (self.timeIntervalSince1970 * 1000.0).rounded()
    }
    init(milliseconds: Double) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds)/1000.0)
    }
    
    func timeAgoCustomDisplay() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        
        if secondsAgo == 0 {
            return "Just now"
        } else if secondsAgo < minute {
            if secondsAgo == 1 {
                return "\(secondsAgo)s"
            } else {
                return "\(secondsAgo)s"
            }
        } else if secondsAgo < hour {
            if secondsAgo / minute == 1 {
                return "\(secondsAgo / minute)min"
            } else {
                return "\(secondsAgo / minute)mins"
            }
        } else if secondsAgo < day {
            if secondsAgo / hour == 1 {
                return "\(secondsAgo / hour)h"
            } else {
                return "\(secondsAgo / hour)h"
            }
        } else if secondsAgo < week {
            if secondsAgo / day == 1 {
                return "\(secondsAgo / day) day ago"
            } else {
                return "\(secondsAgo / day) days ago"
            }
        } else {
            return self.dateString(withFormat: "MMM dd, YYYY")
        }
        
//        if secondsAgo / week == 1 {
//            return "\(secondsAgo / week) week ago"
//        } else {
//            return "\(secondsAgo / week) weeks ago"
//        }
    }
    
    func timeAgoDisplayShort() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        
        if secondsAgo == 0 {
            return "Just now"
        }
        if secondsAgo < minute {
//            return "\(secondsAgo)s"
            return "Just now"
        } else if secondsAgo < hour {
            return "\(secondsAgo / minute) min"
        } else if secondsAgo < day {
            return "\(secondsAgo / hour)h"
        } else if secondsAgo < week {
            return "\(secondsAgo / day)d"
        }
        return "\(secondsAgo / day)d" //"\(secondsAgo / week)wk"
    }
    
    func dateString(withFormat format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func relativeDataTimeDisplays() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        formatter.dateTimeStyle = .named
        return formatter.localizedString(for: self, relativeTo: Date())
    }
    
    func timeAgoDisplay(withDateFormat format: String = "MMM dd, YYYY") -> String {
         let secondsAgo = Int(Date().timeIntervalSince(self))
         let minute = 60
         let hour = 60 * minute
         let day = 24 * hour
         let week = 7 * day
                             
        if secondsAgo < week {
            return self.relativeDataTimeDisplays()
        } else {
            return self.dateString(withFormat: format)
        }
    }
}
