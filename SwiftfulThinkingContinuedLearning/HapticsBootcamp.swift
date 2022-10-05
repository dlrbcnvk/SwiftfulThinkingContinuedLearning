//
//  HapticsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 조성규 on 2022/09/30.
//

import SwiftUI

class HapticManager {
    static let shared = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style :UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct HapticsBootcamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("success") { HapticManager.shared.notification(type: .success) }
            Button("warning") { HapticManager.shared.notification(type: .warning) }
            Button("error") { HapticManager.shared.notification(type: .error) }
            
            Divider()
            
            Button("heavy") { HapticManager.shared.impact(style: .heavy) }
            Button("light") { HapticManager.shared.impact(style: .light) }
            Button("medium") { HapticManager.shared.impact(style: .medium) }
            Button("rigid") { HapticManager.shared.impact(style: .rigid) }
            Button("soft") { HapticManager.shared.impact(style: .soft) }
            
        }
    }
}

struct HapticsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HapticsBootcamp()
    }
}
