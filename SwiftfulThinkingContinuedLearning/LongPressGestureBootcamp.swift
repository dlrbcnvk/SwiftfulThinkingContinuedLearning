//
//  LongPressGestureBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 조성규 on 2022/09/30.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
        
        VStack {
            Rectangle()
                .fill(isSuccess ? .green : .blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: isSuccess ? .infinity : 200, alignment: .leading)
                .background(Color.gray)
            
            HStack {
                Text("Click here")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1, maximumDistance: 50) {
                        withAnimation(.easeInOut) {
                            isSuccess.toggle()
                            print("perform succeded")
                        }
                    } onPressingChanged: { isPressing in
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1)) {
                                isComplete.toggle()
                            }
                        }
                    }
//                    .onLongPressGesture(minimumDuration: 1, maximumDistance: 50) { isPressing in
//                        if isPressing {
//                            withAnimation(.easeInOut(duration: 1)) {
//                                isComplete.toggle()
//                            }
//                        }
//                    } perform: {
//                        withAnimation(.easeOut) {
//                            isSuccess.toggle()
//                        }
//                    }

                    


                
                Text("Reset")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isComplete = true
                        isSuccess = true
                    }
            }
                
        }
        
//        Text(isComplete ? "Completed" : "Not completed")
//            .frame(width: 150, height: 30)
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ? Color.green : Color.gray)
//            .cornerRadius(10)
//            .onLongPressGesture(minimumDuration: 1, maximumDistance: 50) {
//                isComplete.toggle()
//            }
    }
}

struct LongPressGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureBootcamp()
    }
}
