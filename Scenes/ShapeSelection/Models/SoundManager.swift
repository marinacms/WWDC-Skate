//
//  SoundManager.swift
//  
//
//  Created by Marina Cristina Marques dos santos on 15/04/23.
//

import Foundation
import AVFoundation

class SoundManager{
    static let shared = SoundManager()
    var player: AVAudioPlayer?
    
    private init() {
    }
    
    func play(name: String, withExtension: String){
        let url = Bundle.main.url(forResource: name, withExtension: withExtension)!
        
        do{
            self.player = try AVAudioPlayer(contentsOf: url)
            self.player?.play()
        } catch{
            print("não consegui tocar o som")
        }
    }
}
