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
    var backgroundPlayer: AVAudioPlayer?
    
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
    
    func playBackgroundLoop(name: String){
        let url = Bundle.main.url(forResource: name, withExtension: "mp3")!
        
        do{
            self.backgroundPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            self.backgroundPlayer?.numberOfLoops = -1
            
            self.backgroundPlayer?.prepareToPlay()
            self.backgroundPlayer?.volume = 0
            self.backgroundPlayer?.play()
            self.backgroundPlayer?.setVolume(1, fadeDuration: 3.0)
            
            
        } catch{
            print("não consegui tocar o som de background")
        }
    }
    
    func stopPlayBackgroundLoop(){
        self.backgroundPlayer?.stop()
        self.backgroundPlayer = nil
        print("parou")
    }
}
