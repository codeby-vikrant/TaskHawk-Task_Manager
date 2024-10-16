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
    
    var isSameHour: Bool{
        return Calendar.current.compare(self, to: .init(), toGranularity: .hour) == .orderedSame
    }
    
    var isPast: Bool{
        return Calendar.current.compare(self, to: .init(), toGranularity: .hour) == .orderedAscending
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
    
    func createNextWeek() -> [WeekDay]{
        let calender = Calendar.current
        let startOfLastDate = calender.startOfDay(for: self)
        guard let nextDate = calender.date(byAdding: .day, value: 1, to: startOfLastDate) else{
            return []
        }
        return fetchWeek(nextDate)
    }
    
    func createPreviousWeek() -> [WeekDay]{
        let calender = Calendar.current
        let startOfFirstDate = calender.startOfDay(for: self)
        guard let previousDate = calender.date(byAdding: .day, value: -1, to: startOfFirstDate) else{
            return []
        }
        return fetchWeek(previousDate)
    }
    
    struct WeekDay: Identifiable{
        var id: UUID = .init()
        var date: Date
    }
}
