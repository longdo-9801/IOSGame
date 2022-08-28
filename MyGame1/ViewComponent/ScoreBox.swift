//
//  ScoreBox.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 25/08/2022.
//

import SwiftUI

struct ScoreBoxView : View {
    @State var displayPoint = ""
    @ObservedObject var scoreBoard : ScoreGroup
    @Binding var isOpenScoreSheet : Bool
    @ObservedObject var GameState : GameState
    @State var textColor : Color = .gray

    func inputScore(scoreGroup : ScoreGroup) {
        if (GameState.isP2) {
            scoreGroup.finalValue2 = scoreGroup.currentValue
            displayPoint = String(scoreGroup.finalValue2)
            scoreGroup.isSelectable = false
            scoreGroup.isFilled2 = true
        } else {
            scoreGroup.finalValue1 = scoreGroup.currentValue
            displayPoint = String(scoreGroup.finalValue1)
            scoreGroup.isSelectable = false
            scoreGroup.isFilled1 = true
        }
    }
    
    
    var body: some View {
        HStack (spacing : 0) {
                //Spacer()
            Text(scoreBoard.ID).frame(alignment: .leading)
            Spacer(minLength: 100)
            Text(displayPoint).foregroundColor(textColor).frame(alignment: .trailing)
            Spacer().frame(width: 30)
            Button {
                if (GameState.isP2) {
                    if (!scoreBoard.isFilled2 && isOpenScoreSheet && !GameState.isStart) {
                        inputScore(scoreGroup: scoreBoard)
                        self.displayPoint = String(scoreBoard.finalValue2)
                        self.textColor = .black
                        isOpenScoreSheet = false
                        GameState.resetState()
                        GameState.resetDiceCounter()
                        scoreBoard.isSelectable = false
                        GameState.turnNummber += 1
                        GameState.checkEndGame()
                    }
                } else {
                    if (!scoreBoard.isFilled1 && isOpenScoreSheet && !GameState.isStart) {
                        inputScore(scoreGroup: scoreBoard)
                        self.displayPoint = String(scoreBoard.finalValue1)
                        self.textColor = .black
                        GameState.resetState()
                        GameState.resetDiceCounter()
                        isOpenScoreSheet = false
                        scoreBoard.isSelectable = false
                        if (!GameState.is2PlayerMode) {
                            GameState.turnNummber += 1
                        } else {
                            GameState.isP2 = true
                        }
                        
                    }
                }
                
                
            } label: {
                Text("Commit")
            }.frame(alignment: .trailing).buttonStyle(.bordered)
            //Spacer()
        }.onAppear {
            if (GameState.isP2) {
                if (!scoreBoard.isSelectable && !scoreBoard.isFilled2) {
                    self.displayPoint = ""
                } else if (scoreBoard.isSelectable && !scoreBoard.isFilled2){
                    self.displayPoint = String(scoreBoard.currentValue)
                    self.textColor = .gray
                } else {
                    self.displayPoint = String(scoreBoard.finalValue2)
                    self.textColor = .black
                }
            } else {
                if (!scoreBoard.isSelectable && !scoreBoard.isFilled1) {
                    self.displayPoint = ""
                } else if (!scoreBoard.isFilled1){
                    self.displayPoint = String(scoreBoard.currentValue)
                    self.textColor = .gray
                } else {
                    self.displayPoint = String(scoreBoard.finalValue1)
                    self.textColor = .black
                }
            }
            
        }     
    }
}

struct ScoreBoxViewPreview: PreviewProvider {
    @State static var debugBool1 = true
    @State static var debugBool2 = false
    //@State static var board = ScoreGroup(name: "DEBUG", selectState: true)
    @State static var debugState = GameState(dice1: 1,
                                             dice2: 2,
                                             dice3: 3,
                                             dice4: 4,
                                             dice5: 5,
                                             diceValue: [1,1,1,1,1,0])
    static var previews: some View {
        ZStack {
            Color.white
            ScoreBoxView(displayPoint: "50",
                         scoreBoard: debugState.ScoreFourKind,
                         isOpenScoreSheet: $debugBool1,GameState: debugState, textColor: .gray)
        }
        
    }
}
