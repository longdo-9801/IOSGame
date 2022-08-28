//
//  AudioManager.swift
//  MyGame1
//
//  Created by Nguyen Minh Anh on 29/08/2022.
//

import Foundation
import AVFoundation

class AudioManager {
    static var audioPlayer:AVAudioPlayer?

       static func playSounds(soundfile: String) {

           if let path = Bundle.main.path(forResource: soundfile, ofType: nil){
               do {

                   audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                   audioPlayer?.prepareToPlay()
                   audioPlayer?.play()

               } catch {
                   print("Error")
               }
           }
       }
}

