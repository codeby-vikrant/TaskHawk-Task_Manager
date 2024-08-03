//
//  Home Page.swift
//  Task Management
//
//  Created by Vikrant Vani on 03/08/24.
//

import SwiftUI

struct Home_Page: View {
    //Task manager properties
    @State private var currentDate: Date = .init()
    @State private var weeekSlider: [[Date.WeekDay]] = []
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
           HeaderView()
        })
        .vSpacing(.top)
    }
    
    //Header view Part
    @ViewBuilder
    func HeaderView() -> some View{
        VStack(alignment: .leading, spacing: 6){
            HStack(spacing: 5){
                Text(currentDate.format("MMMM"))
                    .foregroundStyle(.darkBlue)
                
                Text(currentDate.format("YYYY"))
                    .foregroundStyle(.gray)
            }
            .hSpacing(.leading)
            .overlay(alignment: .topTrailing, content: {
                Button(action: {}, label: {
                    Image(.pic)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 45, height: 45)
                        .clipShape(.circle)
                })
            })
            .font(.title.bold())
            Text(currentDate.formatted(date: .complete, time: .omitted))
                .font(.callout)
                .fontWeight(.semibold)
                .textScale(.secondary)
                .foregroundStyle(.gray)
        }
        .padding(15)
        .background(.white)
    }
}

#Preview {
    ContentView()
}
