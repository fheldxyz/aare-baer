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
    let cityDict = [
        "brienz":"Brienz",
        "interlaken":"Interlake",
        "thun":"Thun",
        "bern":"Bärn",
        "hagneck":"Hagneck",
        "biel":"Biu",
        "brugg":"Brugg AG"
    ]
    
    var body: some View {
 
        NavigationView {
            Form {
                Section {
                    Text("\(current.current.aare.temperature_prec, specifier: "%.2f")°")
                    Button("load from Api (\(ort))") {
                        current.loadfromAPI(ort: ort)
                    }
                }
                Section {
                    
                    Picker(selection: $ort, label:
                        Text("Hie chasch dr Ort uswähle"), content:
                            {
                                ForEach(citylist, id:\.self) { city in
                                    Text(cityDict[city]!)
                                }
                            }
                    )
                    
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
