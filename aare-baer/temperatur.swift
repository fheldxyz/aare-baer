//
//  temperatur.swift
//  aare-baer
//
//  Created by user on 10.07.21.
//

import SwiftUI

struct temperatur: View {
    
    let aarefontblue = Color(red: 0, green: 111.0/255.0, blue: 186.0/255.0)
    
    @ObservedObject var cities: CityData
    
    var body: some View {
        ZStack {
            
            Color(red: 10.0/255.0, green: 230.0/255.0, blue: 1.0)
                .ignoresSafeArea()
            
            ZStack {
                Image("water")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                Color(.white).blendMode(.sourceAtop)
            }
            .drawingGroup(opaque: false)
            .opacity(0.3)
            .ignoresSafeArea()
            
            
            VStack {
                Text("🧸")
                    .font(.system(size: 70))
                    .padding()
                Text("\(cities.cities[3].aare_prec, specifier: "%.2f")°")
                    .font(.custom("DIN Condensed Bold", size: 90))
                    .foregroundColor(aarefontblue)
                Text("Aaretemperatur z Bärn, 11.11 \n i 2h isches ca. 15.6")
                    .font(.custom("DIN Condensed Bold", size: 18))
                    .multilineTextAlignment(.center)
                    .foregroundColor(aarefontblue)
                    .padding()
                Text("d Aare isch fou")
                    .font(.custom("DIN Condensed Bold", size: 40))
                    .foregroundColor(aarefontblue)
                    .padding()
                
                HStack {
                    VStack {
                        Text("405")
                            .font(.custom("DIN Condensed Bold", size: 70))
                        Text("Wasser in kubik")
                            .font(.custom("DIN Condensed Bold", size: 18))
                    }
                    .foregroundColor(aarefontblue)
                    VStack(alignment: .center) {
                        Image(systemName: "minus.circle.fill")
                            .renderingMode(.original)
                            .font(.system(size: 60))
                        
                    }
                    
                    VStack {
                        Text("23.5°")
                            .font(.custom("DIN Condensed Bold", size: 70))
                        Text("Lufttemperatur")
                            .font(.custom("DIN Condensed Bold", size: 18))
                    }
                    .foregroundColor(aarefontblue)
                                
                }
            }

        }
        
    }
}

struct temperatur_Previews: PreviewProvider {
    static var previews: some View {
        temperatur(cities: CityData())
    }
}
