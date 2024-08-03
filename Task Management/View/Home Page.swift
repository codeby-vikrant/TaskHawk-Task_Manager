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
    @State private var weekSlider: [[Date.WeekDay]] = []
    @State private var currentWeekIndex: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            HeaderView()
        })
        .vSpacing(.top)
        .onAppear(perform: {
            if weekSlider.isEmpty{
                let currentWeek = Date().fetchWeek()
                weekSlider.append(currentWeek)
            }
        })
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
                
                //Week Slider
                TabView(selection: $currentWeekIndex){
                    ForEach(weekSlider.indices, id: \.self) { index in
                        let week = weekSlider[index]
                        WeekView(week)
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 90)
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
    
    //Week View
    @ViewBuilder
    func WeekView(_ week: [Date.WeekDay]) -> some View{
        HStack(spacing: 0){
            ForEach(week) {day in
                VStack(spacing: 8){
                    Text(day.date.format("E"))
                        .font(.callout)
                        .textScale(.secondary)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                    
                    Text(day.date.format("dd"))
                        .font(.callout)
                        .textScale(.secondary)
                        .fontWeight(.bold)
                        .foregroundStyle(.gray)
                        .frame(width: 35, height: 35)
                        .background(content: {
                            
                        })
                        .background(.white.shadow(.drop(radius: 1)), in: .circle)
                }
                .hSpacing(.center)
            }
        }
    }
}

#Preview {
    ContentView()
}
