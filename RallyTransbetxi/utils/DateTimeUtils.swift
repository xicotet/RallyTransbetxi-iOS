//
//  DateTimeUtils.swift
//  RallyTransbetxi
//
//  Created by Pablo on 11/7/24.
//

import Foundation

struct DateTimeUtils {
    static func secondsToDate(seconds: TimeInterval, language: String, country: String) -> String? {
        let date = Date(timeIntervalSince1970: seconds)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "\(language)_\(country)")
        dateFormatter.dateFormat = getDateFormat(language: language)
        
        let dateString = dateFormatter.string(from: date)
        return dateString.prefix(1).uppercased() + dateString.dropFirst()
    }
    
    private static func getDateFormat(language: String) -> String {
        switch language {
        case "es":
            return "EEEE d 'de' MMMM 'de' yyyy"
        case "ca":
            return "EEEE d MMMM 'de' yyyy"
        case "en":
            return "EEEE d 'of' MMMM 'of' yyyy"
        case "de":
            return "EEEE d. MMMM yyyy"
        default:
            return "EEEE d 'of' MMMM 'of' yyyy"
        }
    }
    
    static func monthOfADate(seconds: TimeInterval, language: String, country: String) -> String? {
        let date = Date(timeIntervalSince1970: seconds)
        let dateFormatter = DateFormatter()
        if language == "ca" {
            dateFormatter.locale = Locale(identifier: "es_ES")
        } else {
            dateFormatter.locale = Locale(identifier: "\(language)_\(country)")
        }
        dateFormatter.dateFormat = "MMM"
        
        let dateString = dateFormatter.string(from: date)
        return dateString.prefix(1).uppercased() + dateString.dropFirst()
    }
    
    static func dayOfADate(seconds: TimeInterval, language: String, country: String) -> String? {
        let date = Date(timeIntervalSince1970: seconds)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "\(language)_\(country)")
        dateFormatter.dateFormat = "d"
        
        return dateFormatter.string(from: date)
    }
    
    static func yearOfADate(seconds: TimeInterval, language: String, country: String) -> String? {
        let date = Date(timeIntervalSince1970: seconds)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "\(language)_\(country)")
        dateFormatter.dateFormat = "yyyy"
        
        return dateFormatter.string(from: date)
    }
    
    static func timestampFromFormattedDate(date: String) -> TimeInterval? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        dateFormatter.locale = Locale.current
        
        if let parsedDate = dateFormatter.date(from: date) {
            return parsedDate.timeIntervalSince1970
        }
        return nil
    }
    
    static func formatTimeFromSeconds(seconds: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: seconds)
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        return String(format: "%02d:%02d", hour, minute)
    }
    
    static func secondsUntilStartOfEvent() -> TimeInterval {
        let now = Date()
        var targetDateComponents = DateComponents()
        targetDateComponents.year = Constants.BEGINNING_YEAR
        targetDateComponents.month = Constants.BEGINNING_MONTH
        targetDateComponents.day = Constants.BEGINNING_DAY
        targetDateComponents.hour = 0
        targetDateComponents.minute = 0
        targetDateComponents.second = 0
        
        if let targetDate = Calendar.current.date(from: targetDateComponents) {
            return targetDate.timeIntervalSince(now)
        }
        return 0
    }
}
