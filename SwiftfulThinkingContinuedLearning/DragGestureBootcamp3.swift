//
//  DragGestureBootcamp3.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 조성규 on 2022/09/30.
//

import SwiftUI

struct DragGestureBootcamp3: View {
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            MySignUpView()
                .offset(y: 100)
                .offset(y: 0)
                .offset(y: 10)
        }
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

struct DragGestureBootcamp3_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBootcamp3()
    }
}
