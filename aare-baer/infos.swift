//
//  infos.swift
//  aare-baer
//
//  Created by user on 12.07.21.
//

import SwiftUI

struct infos: View {

    
    @Binding var ort: String
    @ObservedObject var current: CurrentData
    
    let citylist = ["brienz","interlaken","thun","bern","hagneck","biel","brugg"]
    
    var body: some View {
        VStack {
            Text("\(current.current.aare.temperature_prec, specifier: "%.2f")°")
            
            Button("load from Api (\(ort))") {
                current.loadfromAPI(ort: ort)
                
            }
            
            List {
                Section {
                    Picker(selection: $ort, label:
                        Text("Hie chasch dr Ort uswähle"), content:
                            {
                            ForEach(citylist, id:\.self) { city in
                                Text(city)
                            }
                    })
                    .pickerStyle(InlinePickerStyle())
                }
            }
            
        }

    }
}

struct infos_Previews: PreviewProvider {
    static var previews: some View {
        infos(ort:.constant("bern"), current: CurrentData())
    }
}
