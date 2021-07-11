//
//  temperatur.swift
//  aare-baer
//
//  Created by user on 10.07.21.
//

import SwiftUI

struct temperatur: View {
    
    let aarefontblue = Color(red: 0, green: 111.0/255.0, blue: 186.0/255.0)
    
    @ObservedObject var current: CurrentData
    
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
                Text("\(current.current.aare.temperature_prec, specifier: "%.2f")°")
                    .font(.custom("DIN Condensed Bold", size: 90))
                    .foregroundColor(aarefontblue)
                Text("Aaretemperatur z \(current.current.aare.location), am \(current.current.aare.timestring) \n i 2h isches ca. \(current.current.aare.forecast2h, specifier: "%.1f")°")
                    .font(.custom("DIN Condensed Bold", size: 18))
                    .multilineTextAlignment(.center)
                    .foregroundColor(aarefontblue)
                    .padding()
                Text(current.current.aare.temperature_text)
                    .font(.custom("DIN Condensed Bold", size: 40))
                    .foregroundColor(aarefontblue)
                    .padding()
                
                HStack {
                    VStack {
                        Text("\(current.current.aare.flow)")
                            .font(.custom("DIN Condensed Bold", size: 70))
                        Text("Wasser in kubik")
                            .font(.custom("DIN Condensed Bold", size: 18))
                        Text(current.current.aare.flow_text)
                            .font(.custom("DIN Condensed Bold", size: 18))
                    }
                    .foregroundColor(aarefontblue)
                    VStack(alignment: .center) {
                        Text("Kanau")
                            .font(.custom("DIN Condensed Bold", size: 18))
                            .foregroundColor(aarefontblue)
                        if current.current.bueber.state_open_flag {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(aarefontblue)
                                .font(.system(size: 60))
                        }
                        else {
                            Image(systemName: "minus.circle.fill")
                                .renderingMode(.original)
                                .font(.system(size: 60))
                        }
                        
                        
                    }
                    
                    VStack {
                        Text("\(current.current.weather.current.tt, specifier: "%.1f")°")
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
        temperatur(current: CurrentData())
    }
}
