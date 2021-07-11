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
            VStack {
                Text("\(cities.cities[3].aare_prec)")
                
                Button("load") {
                    cities.loadfromAPI()
                    current.loadfromAPI()
                }
            
            }
                .tabItem {
                    Image(systemName: "cloud.drizzle")
                }

            Text("3")
                .tabItem {
                    Image(systemName: "sun.max")
                }

            Text("4")
                .tabItem {
                    Image(systemName: "chart.bar")
                }

            Text("5")
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
