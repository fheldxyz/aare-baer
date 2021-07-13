//
//  wetter.swift
//  aare-baer
//
//  Created by user on 12.07.21.
//

import SwiftUI

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
                    Text("\(current.current.weather.current.tt, specifier: "%.1f")°")
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
                        Image(systemName: "cloud.sun")
                        Text("19°")
                        Text("0 mm")
                    }
                    
                    Group {
                        Text("Hüt nami")
                        Image(systemName: "cloud")
                        Text("20°")
                        Text("1 mm")
                    }
                    
                    Group {
                        Text("Hüt abe")
                        Image(systemName: "sun.max")
                        Text("21°")
                        Text("23 mm")
                    }

                }
                .padding(.horizontal)
                .font(.custom("DIN Condensed Bold", size: 22))
                .foregroundColor(aarefontblue)
                
                
                HStack {
                    VStack {
                        Text("Mittwuch")
                        
                        
                        Image(systemName: "sun.max")
                            .padding()
                        HStack {
                            Text("11°")
                            Text("17°")
                        }
                        
                        Text("10mm")
                        Text("90%")
                    }
                    .padding()
                    VStack {
                        Text("Donsti")
                        
                        
                        Image(systemName: "cloud")
                            .padding()
                        HStack {
                            Text("11°")
                            Text("17°")
                        }
                        
                        Text("10mm")
                        Text("90%")
                    }
                    .padding()
                    VStack {
                        Text("Friti")
                        
                        Image(systemName: "cloud.sun")
                            .padding()
                        HStack {
                            Text("11°")
                            Text("17°")
                        }
                        
                        Text("10mm")
                        Text("90%")
                    }
                    .padding()
                }
                
                .foregroundColor(aarefontblue)
                .font(.custom("DIN Condensed Bold", size: 22))
                
            }
            
        }
    }
}

struct wetter_Previews: PreviewProvider {
    static var previews: some View {
        wetter(current: CurrentData())
    }
}
