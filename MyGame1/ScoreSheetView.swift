//
//  ScoreView.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 25/08/2022.
//

import SwiftUI

struct ScoreSheetView: View {

    @ObservedObject var currentstate : GameState
    @Binding var checkScoreSheet: Bool //Var for opening score sheet
    @State var workaround: Int = 0 // DUMMY DATA
        

        var body: some View {
            //Text("PLACEHOLDER")
            GeometryReader { geometry in

                       ScrollView {
                          ZStack {
                               VStack {
                                   Button {
                                       if(!currentstate.isEndRoll) {
                                           checkScoreSheet = false
                                           currentstate.resetDiceCounter()
                                       }
                                   } label: {
                                       Text("Close Score Sheet")
                                   }
                                   //Display current Dice
                                   HStack {
                                       //Text(String(Dice1.value))
                                       //print("Debug check 3: " + String(Dice1.value))
                                       Spacer()
                                       Image(currentstate.Dice1.image)
                                       Image(currentstate.Dice2.image)
                                       Image(currentstate.Dice3.image)
                                       Image(currentstate.Dice4.image)
                                       Image(currentstate.Dice5.image)
                                       Spacer()
                                       //print("Debug check 4: " + String(Dice1.value))
                                   }
                                   //Upper Group
                                   VStack {
                                       Text("Upper Point Group")
                                       ScoreBoxView(scoreBoard: currentstate.ScoreAce, isOpenScoreSheet: $checkScoreSheet,GameState: currentstate)
                                       ScoreBoxView(scoreBoard: currentstate.ScoreTwo, isOpenScoreSheet: $checkScoreSheet, GameState: currentstate)
                                       ScoreBoxView(scoreBoard: currentstate.ScoreThree, isOpenScoreSheet: $checkScoreSheet, GameState: currentstate)
                                       ScoreBoxView(scoreBoard: currentstate.ScoreFour, isOpenScoreSheet: $checkScoreSheet, GameState: currentstate)
                                       ScoreBoxView(scoreBoard: currentstate.ScoreFive, isOpenScoreSheet: $checkScoreSheet, GameState: currentstate)
                                       ScoreBoxView(scoreBoard: currentstate.ScoreSix, isOpenScoreSheet: $checkScoreSheet, GameState: currentstate)
                                       ScoreTotalBoxView(GameState: currentstate, isUpper: true)
                                   }
//                                   Divider()
                                   VStack {
                                       Text("Lower Point Group")
                                       ScoreBoxView(scoreBoard: currentstate.ScoreThreeKind, isOpenScoreSheet: $checkScoreSheet, GameState: currentstate)
                                       ScoreBoxView(scoreBoard: currentstate.ScoreFourKind, isOpenScoreSheet: $checkScoreSheet, GameState: currentstate)
                                       ScoreBoxView(scoreBoard: currentstate.ScoreFullHouse, isOpenScoreSheet: $checkScoreSheet, GameState: currentstate)
                                       ScoreBoxView(scoreBoard: currentstate.ScoreSmallStraight, isOpenScoreSheet: $checkScoreSheet, GameState: currentstate)
                                       ScoreBoxView(scoreBoard: currentstate.ScoreLargeStraight, isOpenScoreSheet: $checkScoreSheet, GameState: currentstate)
                                       ScoreBoxView(scoreBoard: currentstate.ScoreYahtzee, isOpenScoreSheet: $checkScoreSheet, GameState: currentstate)
                                       ScoreBoxView(scoreBoard: currentstate.ScoreChance, isOpenScoreSheet: $checkScoreSheet, GameState: currentstate)
                                      ScoreTotalBoxView(GameState: currentstate, isUpper: false)
                                   }
                               }
                           }
                       }
            }
            
        }
}
struct ScoreSheetView_Previews: PreviewProvider {
    @State static var debugBool = true
    @State static var debugState = GameState(dice1: 1,
                                             dice2: 2,
                                             dice3: 3,
                                             dice4: 4,
                                             dice5: 5,
                                             diceValue: [1,1,1,1,1,0])
    static var previews: some View {
        ScoreSheetView(currentstate: debugState,checkScoreSheet: $debugBool)
    }
}
