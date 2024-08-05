//
//  Task_ManagementApp.swift
//  Task Management
//
//  Created by Vikrant Vani on 02/08/24.
//

import SwiftUI

@main
struct Task_ManagementApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
