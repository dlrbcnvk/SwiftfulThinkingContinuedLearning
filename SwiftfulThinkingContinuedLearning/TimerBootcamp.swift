//
//  TimerBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 조성규 on 2022/10/04.
//

import SwiftUI

struct TimerBootcamp: View {
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    // current time
    @State var currentDate: Date = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .short
        return formatter
    }
    
    // countdown
    @State var count: Int = 10
    @State var finishedText: String? = nil
    
    // countdown to date
    @State var timeRemaining: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(hour):\(minute):\(second)"
    }
    
    // animation counter
    @State var countAnimation: Int = 0
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))]), center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            
            TabView(selection: $countAnimation) {
                Rectangle()
                    .foregroundColor(.red)
                    .tag(1)
                Rectangle()
                    .foregroundColor(.blue)
                    .tag(2)
                Rectangle()
                    .foregroundColor(.green)
                    .tag(3)
                Rectangle()
                    .foregroundColor(.orange)
                    .tag(4)
                Rectangle()
                    .foregroundColor(.purple)
                    .tag(5)
            }
            .frame(height: 200)
            .tabViewStyle(PageTabViewStyle())
            
//            HStack(spacing: 15) {
//                Circle()
//                    .offset(y: countAnimation == 1 ? -20 : 0)
//                Circle()
//                    .offset(y: countAnimation == 2 ? -20 : 0)
//                Circle()
//                    .offset(y: countAnimation == 3 ? -20 : 0)
//            }
//            .frame(width: 200)
//            .foregroundColor(.white)
            
//            Text(timeRemaining)
//                .font(.system(size: 100, weight: .semibold, design: .monospaced))
//                .foregroundColor(.white)
//                .lineLimit(1)
//                .minimumScaleFactor(0.1)
//                .padding()
        }
        .onReceive(timer) { _ in
//            if count < 1 {
//                finishedText = "Wow!!"
//            } else {
//                count -= 1
//            }
            
//            updateTimeRemaining()
            withAnimation(.default) {
                countAnimation = countAnimation == 5 ? 1 : countAnimation + 1
            }
        }
    }
}

struct TimerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TimerBootcamp()
    }
}
