//
//  Task.swift
//  Task Management
//
//  Created by Vikrant Vani on 03/08/24.
//

import SwiftUI

struct Task: Identifiable{
    var id: UUID = .init()
    var taskTitle: String
    var creationDate: Date = .init()
    var isCompleted: Bool = false
    var tint: Color
}

var sampleTasks: [Task] = [
    .init(taskTitle: "Make a IOS Application", creationDate: .updateHour(-5), isCompleted: true, tint: .taskColor1),
    .init(taskTitle: "Submit All Assignments", creationDate: .updateHour(-3), isCompleted: true, tint: .taskColor2),
    .init(taskTitle: "Trip to waterfall", creationDate: .updateHour(-4), isCompleted: true, tint: .taskColor3),
    .init(taskTitle: "Linked In Profile Update", creationDate: .updateHour(0), isCompleted: true, tint: .taskColor4),
    .init(taskTitle: "Shoes Delivery", creationDate: .updateHour(2), isCompleted: true, tint: .taskColor1),
    .init(taskTitle: "Coursera Course", creationDate: .updateHour(1), isCompleted: true, tint: .taskColor5),
]

extension Date{
    static func updateHour(_ value: Int) -> Date {
        let calender = Calendar.current
        return calender.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
