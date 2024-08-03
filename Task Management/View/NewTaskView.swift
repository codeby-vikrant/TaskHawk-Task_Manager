//
//  NewTaskView.swift
//  Task Management
//
//  Created by Vikrant Vani on 03/08/24.
//

import SwiftUI

struct NewTaskView: View {
    //View Properties
    @Environment(\.dismiss) private var dismiss
    @State private var taskTitle: String = ""
    @State private var taskDate: Date = .init()
    @State private var taskColor: Color = .taskColor1
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .tint(.red)
            })
            .hSpacing(.leading)
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text("Task Title")
                    .font(.caption)
                    .foregroundStyle(.gray)
                TextField("Go for a walk!", text: $taskTitle)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 15)
                    .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 2)), in: .rect(cornerRadius: 10))
            })
            .padding(.top, 5)
            
            HStack(spacing: 12){
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Task Date")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    DatePicker("", selection: $taskDate)
                        .datePickerStyle(.compact)
                })
                .padding(.top, 5)
                
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Task Color")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    TextField("Go for a walk!", text: $taskTitle)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 15)
                        .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 2)), in: .rect(cornerRadius: 10))
                })
                .padding(.top, 5)
            }
        })
        .padding(15)
    }
}

#Preview {
    NewTaskView()
        .vSpacing(.bottom)
}
