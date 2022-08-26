//
//  MainMenuView.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 25/08/2022.
//

import Foundation
import SwiftUI

struct MainMenuView: View {
    @State var isGameView: Bool = false
    @State var isGameView2P: Bool = false
    @State var isHighScoreView1 : Bool = false
    @State var isHighScoreView2 : Bool = false
    @State var isInstructionView : Bool = false
    
    var body: some View {
        ZStack {
            if isGameView {
                DiceRollView(currentstate: GameState(isPlayer2: false), isOpenScoreSheet: false)
            } else if isGameView2P {
                    DiceRollView(currentstate: GameState(isPlayer2: true), isOpenScoreSheet: false)
            } else
            {
                VStack{
                    Button {isGameView.toggle()} label: {Text("SINGLE PLAYER")}
                    Button {isGameView2P.toggle()} label: {Text("TWO PLAYER")}
                    Text("HIGHSCORE")
                    Text("MATCH HISTORY")
                    Button {isInstructionView.toggle()} label: {Text("How To Play")}.sheet(isPresented: $isInstructionView){
                        InstructionView()
                    }
                }
            }

            
        }
                
    }
    
}


struct MainMenyView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView(isGameView: false, isHighScoreView1: false, isHighScoreView2: false, isInstructionView: false)
    }
}
