//
//  MainMenuView.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 25/08/2022.
//

import Foundation
import SwiftUI
import AVFoundation

struct MainMenuView: View {
    @State var isGameView: Bool = false
    @State var isGameView2P: Bool = false
    @State var isHighScoreView1 : Bool = false
    @State var isHighScoreView2 : Bool = false
    @State var isInstructionView : Bool = false
    @State var HighScoreList: Array<MatchRecord1P> = [MatchRecord1P(name1: "Boss", score1: 375,time: Date(timeIntervalSince1970: -432396000))]
    
    //Default list with a pre-saved ghost data, the data it dated to the patent date of Yatzee with the score being the max points that can be won in this iteration of the game.
    
    var body: some View {
        ZStack {
            if isGameView {
                
                DiceRollView(currentstate: GameState(isPlayer2: false, Player1: "Default Name", Player2: nil), isOpenScoreSheet: false, isRestart: $isGameView, recordList: $HighScoreList).onAppear(){
                    
                }
            } else if isGameView2P {
                DiceRollView(currentstate: GameState(isPlayer2: true, Player1: "Default Name", Player2: "Default Opponent"), isOpenScoreSheet: false, isRestart: $isGameView2P, recordList: $HighScoreList).onAppear(){
                    
                }
            } else
            {
                VStack{
                    Image("Logo")
                    Image("LogoDice")
                    Spacer()
                    Button {isGameView.toggle()} label: {Text("SINGLE PLAYER")}.buttonStyle(.bordered)
                    Button {/*isGameView2P.toggle()*/} label: {
                        Text("TWO PLAYER - TBA").foregroundColor(.gray)
                    }.buttonStyle(.bordered)
                    Button {isHighScoreView1.toggle()} label: {Text("HIGHSCORE")}.sheet(isPresented: $isHighScoreView1){
                        HSView(recordList: $HighScoreList, isRestart: $isHighScoreView1)
                    }.buttonStyle(.bordered)
                    Button{}label : {Text("MATCH HISTORY - TBA").foregroundColor(.gray)}.buttonStyle(.bordered)
                    Button {isInstructionView.toggle()} label: {Text("How To Play")}.sheet(isPresented: $isInstructionView){
                        InstructionView()
                    }.onAppear(){
                        MusicManager.playSounds(soundfile: "mainMenuBGM.mp3")
                    }.buttonStyle(.bordered)
                    Spacer()
                }
            }

            
        }
                
    }
    
}

struct MainMenyView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
