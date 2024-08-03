//
//  Date+Extensions.swift
//  Task Management
//
//  Created by Vikrant Vani on 03/08/24.
//

import SwiftUI

//Date extension for ui
extension Date{
    //custom date format
    func format(_ format: String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    var isToday: Bool{
        return Calendar.current.isDateInToday(self)
    }
    
    //fetching week based on given date
    func fetchWeek(_ date: Date = .init()) -> [WeekDay]{
        let calender = Calendar.current
        let startOfDate = calender.startOfDay(for: date)
        
        var week: [WeekDay] = []
        let weekForDate = calender.dateInterval(of: .weekOfMonth, for: startOfDate)
        guard let startOfWeek = weekForDate?.start else{
            return []
        }
        (0..<7).forEach{ index in
            if let weekDay = calender.date(byAdding: .day, value: index, to: startOfWeek){
                week.append(.init(date: weekDay))
            }
        }
        return week
    }
    struct WeekDay: Identifiable{
        var id: UUID = .init()
        var date: Date
    }
}
