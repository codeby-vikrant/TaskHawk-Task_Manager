//
//  Home Page.swift
//  Task Management
//
//  Created by Vikrant Vani on 03/08/24.
//

import SwiftUI

struct Home_Page: View {
    @State private var currentDate: Date = .init()
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
           HeaderView()
        })
        .vSpacing(.top)
    }
    @ViewBuilder
    func HeaderView() -> some View{
        VStack(alignment: .leading, spacing: 6){
            HStack(spacing: 5){
                Text(currentDate.format("MMMM"))
                    .foregroundStyle(.darkBlue)
                
                Text(currentDate.format("YYYY"))
                    .foregroundStyle(.gray)
            }
            .font(.title.bold())
            Text(currentDate.formatted(date: .complete, time: .omitted))
                .font(.callout)
                .fontWeight(.semibold)
                .textScale(.secondary)
                .foregroundStyle(.gray)
        }
        .padding(15)
        .hSpacing(.leading)
    }
}

#Preview {
    ContentView()
}
