//
//  wetter.swift
//  aare-baer
//
//  Created by user on 12.07.21.
//

import SwiftUI

let weatherIcon = [
1:"sun.max",
2:"cloud.sun",
3:"cloud.sun",
4:"cloud",
5:"cloud.sun.bolt",
6:"cloud.heavyrain",
7:"cloud.snow",
8:"cloud.fog",
9:"cloud.sleet",
10:"cloud.sun.rain",
11:"cloud.drizzle",
12:"cloud.snow",
13:"cloud.bolt.rain",
14:"cloud",
15:"cloud.sleet"
]


struct wetter: View {
    
    @ObservedObject var current: CurrentData
    
    let aaregreen = Color(red: 0, green: 1.0, blue: 147.0/255.0)
    let aarefontblue = Color(red: 0, green: 111.0/255.0, blue: 186.0/255.0)
    
    let columnsToday = [
        GridItem(.flexible(minimum: 85)),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let columnsThreeDays = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    
    var body: some View {
        ZStack {
            aaregreen
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("\(current.current.weather.current.tt, specifier: "%.1f")°  ")
                    Text("\(current.current.weather.current.rr) mm")
                }
                .font(.custom("DIN Condensed Bold", size: 50))
                .foregroundColor(aarefontblue)
                .padding(.vertical)
                
                Text("Ds wätter ds \(current.current.aare.location)")
                    .font(.custom("DIN Condensed Bold", size: 18))
                    .foregroundColor(aarefontblue)
                    
                LazyVGrid(columns: columnsToday, alignment: .leading, spacing: 20) {
                    
                    
                    Group {
                        Text("Hüt morge")
                        Image(systemName: weatherIcon[current.current.weather.today.v.symt]  ?? "questionmark.circle")
                        Text("\(current.current.weather.today.v.tt)°")
                        Text("\(current.current.weather.today.v.rr) mm")
                    }
                    
                    Group {
                        Text("Hüt nami")
                        Image(systemName: weatherIcon[current.current.weather.today.n.symt]  ?? "questionmark.circle")
                        Text("\(current.current.weather.today.n.tt)°")
                        Text("\(current.current.weather.today.n.rr) mm")
                    }
                    
                    Group {
                        Text("Hüt abe")
                        Image(systemName: weatherIcon[current.current.weather.today.a.symt]  ?? "questionmark.circle")
                        Text("\(current.current.weather.today.a.tt)°")
                        Text("\(current.current.weather.today.a.rr) mm")
                    }

                }
                .padding(.horizontal)
                .font(.custom("DIN Condensed Bold", size: 22))
                .foregroundColor(aarefontblue)
                
                
                HStack {
                    verticalDailyWeather(dayIndex: 0, current: current)
                    verticalDailyWeather(dayIndex: 1, current: current)
                    verticalDailyWeather(dayIndex: 2, current: current)
                }
                
                .foregroundColor(aarefontblue)
                .font(.custom("DIN Condensed Bold", size: 22))
                
            }
            .frame(maxWidth: 400)
            
        }
    }
}

struct verticalDailyWeather: View {
    
    let dayIndex: Int
    
    @ObservedObject var current: CurrentData
    
    var body: some View {
        VStack {
            Text(current.current.weather.forecast[dayIndex].day)
            
            Image(systemName: weatherIcon[current.current.weather.forecast[dayIndex].symt]  ?? "questionmark.circle")
                .padding()
            HStack {
                Text("\(current.current.weather.forecast[dayIndex].tn)°")
                Text("\(current.current.weather.forecast[dayIndex].tx)°")
            }
            
            Text("\(current.current.weather.forecast[dayIndex].rr) mm")
            Text("\(current.current.weather.forecast[dayIndex].rrisk)%")
        }
        .padding()
    }
}

struct wetter_Previews: PreviewProvider {
    static var previews: some View {
        wetter(current: CurrentData())
    }
}
