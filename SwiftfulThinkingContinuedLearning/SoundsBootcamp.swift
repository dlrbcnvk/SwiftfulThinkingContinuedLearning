//
//  SoundsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 조성규 on 2022/09/30.
//

import SwiftUI
import AVKit // audio video kit

class SoundManager {
    
    static let shared = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case ding
        case badum
    }
    
    func playSound(sound: SoundOption){
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.play()
        } catch let error {
            print("DEBUG: Error playing sound. \(error.localizedDescription)")
        }
    }
}

struct SoundsBootcamp: View {
    
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Play sound 1") {
                SoundManager.shared.playSound(sound: .ding)
            }
            
            Button("Play sound 2") {
                SoundManager.shared.playSound(sound: .badum)
            }
        }
    }
}

struct SoundsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SoundsBootcamp()
    }
}
