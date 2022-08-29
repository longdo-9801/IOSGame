//
//  ScoreBox.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 25/08/2022.
//

import SwiftUI

//View contain the name of the Score group, the points and the button to fill
struct ScoreBoxView : View  {
    @State var displayPoint = "" //use to store the value that will be display
    @ObservedObject var scoreBoard : ScoreGroup //use to intergrate the scoregroup
    @Binding var isOpenScoreSheet : Bool //Use to close Score sheet
    @ObservedObject var GameState : GameState //To check game data
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
            //Show name of score group
            Text(scoreBoard.ID).padding(.leading, 5)
            Spacer(minLength: 100)
            //Display score, value are updated from diceRoll view
            Text(displayPoint).foregroundColor(textColor).frame(alignment: .trailing)
            Spacer().frame(width: 30)
            //Button to fill the value, will also reset all necessary value for the next turn
            Button {
                if (GameState.isP2) {
                    if (!scoreBoard.isFilled2 && isOpenScoreSheet && !GameState.isStart && scoreBoard.isSelectable) {
                        inputScore(scoreGroup: scoreBoard)
                        self.displayPoint = String(scoreBoard.finalValue2)
                        self.textColor = .black
                        EffectManager.playSounds(soundfile: "pencil.mp3")
                        GameState.resetState()
                        GameState.resetDiceCounter()
                        scoreBoard.isSelectable = false
                        GameState.turnNumber += 1
                        GameState.checkEndGame()
                        isOpenScoreSheet = false
                    }
                } else {
                    if (!scoreBoard.isFilled1 && isOpenScoreSheet && !GameState.isStart && scoreBoard.isSelectable) {
                        inputScore(scoreGroup: scoreBoard)
                        self.displayPoint = String(scoreBoard.finalValue1)
                        self.textColor = .black
                        EffectManager.playSounds(soundfile: "pencil.mp3")
                        GameState.resetState()
                        GameState.resetDiceCounter()
                        scoreBoard.isSelectable = false
                        if (!GameState.is2PlayerMode) {
                            GameState.turnNumber += 1// Only update the turn number on Player 2 turn
                        } else {
                            GameState.isP2 = true
                        }
                        GameState.checkEndGame()
                        isOpenScoreSheet = false
                    }
                }
                
                
            } label: {
                Text("Commit")
            }.padding(.trailing,5).buttonStyle(.bordered)
        }.onAppear {
            //Logic check for display number, empty for not selectable, gray for slecteable but not filled, black for filled.
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
