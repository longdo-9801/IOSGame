//
//  HighScoreView.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 25/08/2022.
//

import SwiftUI

struct HSView : View {
    @Binding var recordList : Array<MatchRecord1P>
    @State var gameState : GameState? = nil
    @Binding var isRestart : Bool
    
    
    func addNewRecord() {
        recordList.append(MatchRecord1P(name1: "Default", score1: gameState?.finalScoreP1 ?? 0))
        
    }
    
    var body: some View {
        ZStack {
            VStack{
                Text("Play Record").onAppear(){
                    //Add new record if lauch from DiceRollView
                    if (gameState != nil) {
                        print(gameState!.finalScoreP1)
                        addNewRecord()
                        gameState?.isEndGame = false
                    }
                }
                Button {
                    //Toggle to launch/close view
                    isRestart.toggle()
                } label: {
                    Text("Back to main menu")
                }
                List {
                    ForEach(recordList) { record in
                        ResultBox(record: record)
                    }
                }
        
            }
        }
    }
}

struct HSView_Previews: PreviewProvider {
    @State static var oeviewList : [MatchRecord1P] = [MatchRecord1P(name1: "Boss", score1: 375),MatchRecord1P(name1: "Boss", score1: 375),MatchRecord1P(name1: "Boss", score1: 375)]
    @State static var debugBool = false
    static var previews: some View {
        HSView(recordList: $oeviewList, isRestart: $debugBool)
    }
}
