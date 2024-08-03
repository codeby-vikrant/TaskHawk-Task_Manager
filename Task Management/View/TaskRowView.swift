//
//  TaskRowView.swift
//  Task Management
//
//  Created by Vikrant Vani on 03/08/24.
//

import SwiftUI

struct TaskRowView: View {
    @Binding var task: Task
    var body: some View {
        HStack(alignment: .top, spacing: 15){
            Circle()
                .fill(.darkBlue)
                .frame(width: 10, height: 10)
                .padding(4)
                .background(.white.shadow(.drop(color: .black.opacity(0.1), radius: 3)), in: .circle)
        }
    }
}

#Preview {
    ContentView()
}
