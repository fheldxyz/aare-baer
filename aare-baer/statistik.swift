//
//  statistik.swift
//  aare-baer
//
//  Created by user on 12.07.21.
//

import SwiftUI

struct statistik: View {
    
    @ObservedObject var current: CurrentData
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct statistik_Previews: PreviewProvider {
    static var previews: some View {
        statistik(current: CurrentData())
    }
}
