//
//  GeometryReaderBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 조성규 on 2022/09/30.
//

import SwiftUI

struct GeometryReaderBootcamp: View {
    
    @State var geoMidX: Double = 0
    @State var geoPercentage: Double = 0
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        let maxDistance = UIScreen.main.bounds.width / 2
                        let currentX = geometry.frame(in: .global).midX
                        let percentage = Double(1 - (currentX / maxDistance))
                        VStack {
                            RoundedRectangle(cornerRadius: 20)
                            Text("geometry frame midX is \(currentX)")
                            Text("geo percentage is \(percentage)")
                        }
                        .rotation3DEffect(Angle(degrees: getPercentage(geo: geometry) * 40), axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        }
        
        //        GeometryReader { geometry in
        //            HStack(spacing: 0) {
        //                Rectangle()
        //                    .fill(Color.red)
        //                    .frame(width: geometry.size.width * 0.6666)
        //                Rectangle()
        //                    .fill(Color.blue)
        //            }
        //            .ignoresSafeArea()
        //        }
    }
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        let percentage = Double(1 - (currentX / maxDistance))
        geoMidX = currentX
        geoPercentage = percentage
        return percentage
    }
}

struct GeometryReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderBootcamp()
    }
}
