//
//  DateHelper.swift
//  HW01Swift
//
//  Created by Kirill on 09/02/2024.
//  Copyright © 2024 Kirill. All rights reserved.
//
import Foundation

final class DateHelper {
    
    static func getDate(date: Date?) -> String {
        
        guard let date = date else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YYYY hh:mm"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        return dateFormatter.string(from: date)
    }
}
