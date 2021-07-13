//
//  ContentView.swift
//  aare-baer
//
//  Created by user on 10.07.21.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(.white)
    }

    
    let aareblue = Color(red: 10.0/255.0, green: 230.0/255.0, blue: 1.0)
    
    @ObservedObject var cities = CityData()
    @ObservedObject var current = CurrentData()
    
    
    var body: some View {
        TabView {
            temperatur(current: current)
            .tabItem {
                Image(systemName: "thermometer")
            }
            wetter(current: current)
                .tabItem {
                    Image(systemName: "cloud.drizzle")
                }

            sonne(current: current)
                .tabItem {
                    Image(systemName: "sun.max")
                }

            statistik(current: current)
                .tabItem {
                    Image(systemName: "chart.bar")
                }

            infos(current: current)
                .tabItem {
                    Image(systemName: "info.circle")
                }


        }.accentColor(aareblue)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
