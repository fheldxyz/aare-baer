//
//  sonne.swift
//  aare-baer
//
//  Created by user on 12.07.21.
//

import SwiftUI

struct sonne: View {
    
    @ObservedObject var current: CurrentData
    
    let aarefontblue = Color(red: 0, green: 111.0/255.0, blue: 186.0/255.0)
    
    var body: some View {
        ZStack {
            Color(red: 1, green: 231.0/255.0, blue: 0.0)
                .ignoresSafeArea()
            Text(current.current.sun.today.suntotal)
                .font(.custom("DIN Condensed Bold", size: 90))
                .foregroundColor(aarefontblue)
        }
    }
}

struct sonne_Previews: PreviewProvider {
    static var previews: some View {
        sonne(current: CurrentData())
    }
}
