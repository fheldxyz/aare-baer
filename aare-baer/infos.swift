//
//  infos.swift
//  aare-baer
//
//  Created by user on 12.07.21.
//

import SwiftUI

struct infos: View {
    
    @ObservedObject var current: CurrentData
    
    var body: some View {
        VStack {
            Text("\(current.current.aare.temperature_prec, specifier: "%.2f")°")
            
            Button("load from Api (thun)") {
                current.loadfromAPI()
            }
        
        }

    }
}

struct infos_Previews: PreviewProvider {
    static var previews: some View {
        infos(current: CurrentData())
    }
}
