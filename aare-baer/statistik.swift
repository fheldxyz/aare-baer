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
        Path { path in
            path.move(to: CGPoint(x: 0, y: 250))
            path.addLine(to: CGPoint(x: 50, y: 200))
            path.addLine(to: CGPoint(x: 100, y: 225))
            path.addLine(to: CGPoint(x: 150, y: 145))
            path.addLine(to: CGPoint(x: 200, y: 155))
            path.addLine(to: CGPoint(x: 250, y: 105))
            path.addLine(to: CGPoint(x: 300, y: 145))
        }
        .stroke(Color.blue)
        .frame(width: 300, height: 300, alignment: .center)
    }
}

struct statistik_Previews: PreviewProvider {
    static var previews: some View {
        statistik(current: CurrentData())
    }
}
