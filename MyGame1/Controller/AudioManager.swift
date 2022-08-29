//
//  AudioManager.swift
//  MyGame1
//
//  Created by Nguyen Minh Anh on 29/08/2022.
//

import Foundation
import AVFoundation

class MusicManager {
    static var audioPlayer:AVAudioPlayer?

       static func playSounds(soundfile: String) {

           if let path = Bundle.main.path(forResource: soundfile, ofType: nil){
               do {

                   audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                   audioPlayer?.numberOfLoops = -1
                   audioPlayer?.prepareToPlay()
                   audioPlayer?.play()

               } catch {
                   print("Error")
               }
               
           }
           let audioSession = AVAudioSession.sharedInstance()
           do {
               try audioSession.setCategory(.ambient, mode: .default, options: [.mixWithOthers])
           } catch {
               print("Failed to set audio session category.")
           }
       }
}

class EffectManager {
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

