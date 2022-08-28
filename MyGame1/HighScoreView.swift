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
    
//    init(list : Array<MatchRecord1P>) {
//        self.recordList = list
//    }
//
//    init(list : Array<MatchRecord1P>, gameState : GameState) {
//        self.recordList = list
//        self.gameState = gameState
//    }
    
    func addNewRecord() {
        recordList.append(MatchRecord1P(name1: "Default", score1: gameState!.finalScoreP1))
        
    }
    
    var body: some View {
        ZStack {
            VStack{
                Text("Play Record")
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
    static var previews: some View {
        HSView(recordList: $oeviewList)
    }
}
