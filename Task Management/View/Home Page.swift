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
    @State private var currentWeekIndex: Int = 1
    @State private var createWeek: Bool = false
    @State private var tasks: [Task] = sampleTasks.sorted(by: {$1.creationDate > $0.creationDate})
    @State private var createNewTask: Bool = false
    
    //Animation Namespace
    @Namespace private var animation
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            HeaderView()
            
            ScrollView(.vertical){
                VStack{
                    //Tasks View
                    TasksView()
                }
                .hSpacing(.center)
                .vSpacing(.center)
            }
            .scrollIndicators(.hidden)
        })
        .vSpacing(.top)
        .overlay(alignment: .bottomTrailing, content: {
            Button(action: {
                createNewTask.toggle()
            }, label: {
                Image(systemName: "plus")
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 55, height: 55)
                    .background(.darkBlue.shadow(.drop(color: .black.opacity(0.25), radius: 5, x: 10, y: 10)), in: .circle)
            })
            .padding(15)
        })
        .onAppear(perform: {
            if weekSlider.isEmpty{
                let currentWeek = Date().fetchWeek()
                
                if let firstDate = currentWeek.first?.date{
                    weekSlider.append(firstDate.createPreviousWeek())
                }
                
                weekSlider.append(currentWeek)
                
                if let lastDate = currentWeek.last?.date{
                    weekSlider.append(lastDate.createNextWeek())
                }
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
                    .font(.title.bold())
                
                Text(currentDate.formatted(date: .complete, time: .omitted))
                    .font(.callout)
                    .fontWeight(.semibold)
                    .textScale(.secondary)
                    .foregroundStyle(.gray)
            }
            //Week Slider
            TabView(selection: $currentWeekIndex){
                ForEach(weekSlider.indices, id: \.self) { index in
                    let week = weekSlider[index]
                    WeekView(week)
                        .padding(.horizontal, 15)
                        .tag(index)
                }
            }
            .padding(.horizontal, -15)
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
        
        .padding(15)
        .background(.white)
        .onChange(of: currentWeekIndex, initial: false){ oldValue, newValue in
            if(newValue == 0 || newValue == (weekSlider.count - 1)){
                createWeek = true
            }
        }
    }
    
    //Week View Part
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
                        .foregroundStyle(isSameDate(day.date, currentDate) ? .white : .gray)
                        .frame(width: 35, height: 35)
                        .background(content: {
                            if isSameDate(day.date, currentDate){
                                Circle()
                                    .fill(.darkBlue)
                                    .matchedGeometryEffect(id: "TABINDICATOR", in: animation)
                            }
                            if day.date.isToday{
                                Circle()
                                    .fill(.cyan)
                                    .frame(width: 5, height: 5)
                                    .vSpacing(.bottom)
                                    .offset(y: 12)
                            }
                        })
                        .background(.white.shadow(.drop(radius: 1)), in: .circle)
                }
                .hSpacing(.center)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.snappy){
                        currentDate = day.date
                    }
                }
            }
        }
        .background{
            GeometryReader{
                let minX = $0.frame(in: .global).minX
                Color.clear
                    .preference(key: OffsetKey.self, value: minX)
                    .onPreferenceChange(OffsetKey.self) { value in
                        if value.rounded() == 15 && createWeek{
                            paginateWeek()
                            createWeek = false
                        }
                    }
            }
        }
    }
    
    //Tasks View Part
    func TasksView() -> some View{
        VStack(alignment: .leading, spacing: 35){
            ForEach($tasks){ $task in
                TaskRowView(task: $task)
                    .background(alignment: .leading){
                        if tasks.last?.id != task.id{
                            Rectangle()
                                .frame(width: 1)
                                .offset(x: 8)
                                .padding(.bottom, -35)
                        }
                    }
            }
        }
        .padding([.vertical, .leading], 15)
        .padding(.top, 15)
    }
    
    func paginateWeek(){
        if weekSlider.indices.contains(currentWeekIndex){
            if let firstDate = weekSlider[currentWeekIndex].first?.date, currentWeekIndex == 0 {
                weekSlider.insert(firstDate.createPreviousWeek(), at: 0)
                weekSlider.removeLast()
                currentWeekIndex = 1
            }
            
            if let lastDate = weekSlider[currentWeekIndex].first?.date, currentWeekIndex == (weekSlider.count - 1) {
                weekSlider.append(lastDate.createNextWeek())
                weekSlider.removeFirst()
                currentWeekIndex = weekSlider.count - 2
            }
        }
        
    }
}

#Preview {
    ContentView()
}
