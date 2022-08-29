//
//  TestView.swift
//  MyGame1
//
//  Created by Nguyen Minh Anh on 28/08/2022.
//

import SwiftUI
import AVFoundation

//class PlayViewModel {
//    private var audioPlayer: AVAudioPlayer!
//    func play() {
//        let sound = Bundle.main.path(forResource: "dice", ofType: "mp3")
//        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
//        self.audioPlayer.play()
//    }
//}

struct TestView: View {

    var body: some View {
        Button {
            print(">> tap up")
            EffectManager.playSounds(soundfile: "dice.mp3")
        } label: {
            Text("Audio")
        }
    }
}


struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
