//
//  ContentView.swift
//  GridCalendar
//
//  Created by 김경완 on 8/4/24.
//

import SwiftUI

struct ContentView: View {
    //declare layout variable
    let layout = [
        GridItem(.flexible(minimum:40)),
        GridItem(.flexible(minimum:40)),
        GridItem(.flexible(minimum:40)),
        GridItem(.flexible(minimum:40))
    ]
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: layout, pinnedViews: [.sectionHeaders]) {
                    ForEach(year, id: \.name){ month in
                        Section(header: Text(verbatim: month.name).font(.headline)) {
                            ForEach(month.days) { day in
                                Capsule()
                                    .overlay(Text("\(day.value)").foregroundColor(.white))
                                    .foregroundColor(.blue)
                                    .frame(height: 40)
                            }
                        }
                    }
                }
            }
        }
}

//Month Structure
struct Month {
    let name : String
    let numberOfDays: Int
    var days : [Day]
    
    init(name: String, numberOfDays: Int) {
        self.name = name
        self.numberOfDays = numberOfDays
        self.days = []
        
        for n in 1...numberOfDays {
            self.days.append(Day(value: n))
        }
        
    }
}

//Day Structure
struct Day: Identifiable {
    let id = UUID()
    let value : Int
}

let year = [
    Month(name: "January", numberOfDays: 31),
    Month(name: "February", numberOfDays: 28),
    Month(name: "March", numberOfDays: 31),
    Month(name: "April", numberOfDays: 30),
    Month(name: "May", numberOfDays: 31),
    Month(name: "June", numberOfDays: 30),
    Month(name: "July", numberOfDays: 31),
    Month(name: "August", numberOfDays: 31),
    Month(name: "September", numberOfDays: 30),
    Month(name: "October", numberOfDays: 31),
    Month(name: "November", numberOfDays: 30),
    Month(name: "December", numberOfDays: 31),
    
]

#Preview {
    ContentView()
}