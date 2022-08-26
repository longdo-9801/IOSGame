//
//  ScoreView.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 25/08/2022.
//

import SwiftUI

struct ScoreView: View {

    @ObservedObject var currentstate : GameState
    @Binding var checkScoreSheet: Bool
    @State var finalScore: Int = 0
        
    /* Upper Group */
    func upperGroupCheck() {
        var diceValueCount : Array = currentstate.diceValueCount
        if (!currentstate.ScoreAce.isFilled1 && diceValueCount[0] > 0) {
            currentstate.ScoreAce.isSelectable = true
            currentstate.ScoreAce.currentValue = 1 * diceValueCount[0]
      }
        if (!currentstate.ScoreTwo.isFilled1 && diceValueCount[1] > 0) {
            currentstate.ScoreTwo.isSelectable = true
            currentstate.ScoreTwo.currentValue = 2 * diceValueCount[1]
      }
        if (!currentstate.ScoreThree.isFilled1 && diceValueCount[2] > 0) {
            currentstate.ScoreThree.isSelectable = true
            currentstate.ScoreThree.currentValue = 3 * diceValueCount[2]
      }
        if (!currentstate.ScoreFour.isFilled1 && diceValueCount[3] > 0) {
            currentstate.ScoreFour.isSelectable = true
            currentstate.ScoreFour.currentValue = 4 * diceValueCount[3]
      }
        if (!currentstate.ScoreFive.isFilled1 && diceValueCount[4] > 0) {
            currentstate.ScoreFive.isSelectable = true
            currentstate.ScoreFive.currentValue = 5 * diceValueCount[4]
      }
        if (!currentstate.ScoreSix.isFilled1 && diceValueCount[5] > 0) {
            currentstate.ScoreSix.isSelectable = true
            currentstate.ScoreSix.currentValue = 6 * diceValueCount[5]
          
      }
    }
    
    /* Lower Group */
    func checkDiceCombo() {
        var valueIndex: Int = 1
        var diceValueCount : Array = currentstate.diceValueCount
        if (currentstate.isP2) {
            for diceValue in diceValueCount {
                if (diceValue == 5) {
                if (!currentstate.ScoreYahtzee.isFilled2) {
                currentstate.ScoreYahtzee.isSelectable = true
                currentstate.ScoreYahtzee.currentValue = 40
                }
                if (!currentstate.ScoreThreeKind.isFilled2) {
                currentstate.ScoreThreeKind.isSelectable = true
                currentstate.ScoreThreeKind.currentValue = valueIndex * 3
                }
                if (!currentstate.ScoreFourKind.isFilled2) {
                currentstate.ScoreFourKind.isSelectable = true
                currentstate.ScoreFourKind.currentValue = valueIndex * 4
                }

                } else if (diceValue == 4) {
                if (!currentstate.ScoreThreeKind.isFilled2) {
                currentstate.ScoreThreeKind.isSelectable = true
                currentstate.ScoreThreeKind.currentValue = valueIndex * 3
                }
                if (!currentstate.ScoreFourKind.isFilled2) {
                currentstate.ScoreFourKind.isSelectable = true
                currentstate.ScoreFourKind.currentValue = valueIndex * 4
                }

                } else if (diceValue == 3) {
                    if (!currentstate.ScoreFullHouse.isFilled2) {
                        for diceValue2 in currentstate.diceValueCount {
                            if (diceValue2 == 2) {
                                currentstate.ScoreFullHouse.isSelectable = true
                                currentstate.ScoreFullHouse.currentValue = 25
                            }
                        }
                    }
                    if (!currentstate.ScoreThreeKind.isFilled2) {
                        currentstate.ScoreThreeKind.isSelectable = true
                        currentstate.ScoreThreeKind.currentValue = valueIndex * 3
                    }
                }
            //DEBUG CODE//print("Index position: \(valueIndex) Value: \(diceValue)")
            valueIndex += 1
            }
        } else {
            for diceValue in diceValueCount {
                if (diceValue == 5) {
                if (!currentstate.ScoreYahtzee.isFilled1) {
                currentstate.ScoreYahtzee.isSelectable = true
                currentstate.ScoreYahtzee.currentValue = 40
                }
                if (!currentstate.ScoreThreeKind.isFilled1) {
                currentstate.ScoreThreeKind.isSelectable = true
                currentstate.ScoreThreeKind.currentValue = valueIndex * 3
                }
                if (!currentstate.ScoreFourKind.isFilled1) {
                currentstate.ScoreFourKind.isSelectable = true
                currentstate.ScoreFourKind.currentValue = valueIndex * 4
                }

                } else if (diceValue == 4) {
                if (!currentstate.ScoreThreeKind.isFilled1) {
                currentstate.ScoreThreeKind.isSelectable = true
                currentstate.ScoreThreeKind.currentValue = valueIndex * 3
                }
                if (!currentstate.ScoreFourKind.isFilled1) {
                currentstate.ScoreFourKind.isSelectable = true
                currentstate.ScoreFourKind.currentValue = valueIndex * 4
                }

                } else if (diceValue == 3) {
                    if (!currentstate.ScoreFullHouse.isFilled1) {
                        for diceValue2 in currentstate.diceValueCount {
                            if (diceValue2 == 2) {
                                currentstate.ScoreFullHouse.isSelectable = true
                                currentstate.ScoreFullHouse.currentValue = 25
                            }
                        }
                    }
                    if (!currentstate.ScoreThreeKind.isFilled1) {
                        currentstate.ScoreThreeKind.isSelectable = true
                        currentstate.ScoreThreeKind.currentValue = valueIndex * 3
                    }
                }
            //DEBUG CODE//print("Index position: \(valueIndex) Value: \(diceValue)")
            valueIndex += 1
            }
        }
            
    }
    func checkDiceSequence() {
        var diceValueCount : Array = currentstate.diceValueCount
        // Logic check explanation: As the sum of all value count is always 5 and there must be at least one of four sequential dice value
        //, if there are two values that appear twice, one of the remaining two value will be 0
        // Example : if there are 2x I, 2x II then either IV or III is equal to 0 which will stop the logic check
        if (currentstate.isP2) {
            if (!currentstate.ScoreSmallStraight.isFilled2) {
                if (diceValueCount[0]>=1 && diceValueCount[1]>=1 && diceValueCount[2]>=1 && diceValueCount[3]>=1)
                || (diceValueCount[1]>=1 && diceValueCount[2]>=1 && diceValueCount[3]>=1 && diceValueCount[4]>=1)
                || (diceValueCount[2]>=1 && diceValueCount[3]>=1 && diceValueCount[4]>=1 && diceValueCount[5]>=1)
                {
                    currentstate.ScoreSmallStraight.isSelectable = true
                    currentstate.ScoreSmallStraight.currentValue = 30
                }
            }
            // As the sequence must contain one each dice value, only a straight foward check of the value count of two possible sequence is needed
            if (!currentstate.ScoreLargeStraight.isFilled2) {
                if (diceValueCount[0]==1 && diceValueCount[1]==1 && diceValueCount[2]==1 && diceValueCount[3]==1 && diceValueCount[4]==1)
                || (diceValueCount[1]==1 && diceValueCount[2]==1 && diceValueCount[3]==1 && diceValueCount[4]==1 && diceValueCount[5]==1)
                {
                    currentstate.ScoreLargeStraight.isSelectable = true
                    currentstate.ScoreLargeStraight.currentValue = 40
                }
            }
        } else {
            if (!currentstate.ScoreSmallStraight.isFilled1) {
                if (diceValueCount[0]>=1 && diceValueCount[1]>=1 && diceValueCount[2]>=1 && diceValueCount[3]>=1)
                || (diceValueCount[1]>=1 && diceValueCount[2]>=1 && diceValueCount[3]>=1 && diceValueCount[4]>=1)
                || (diceValueCount[2]>=1 && diceValueCount[3]>=1 && diceValueCount[4]>=1 && diceValueCount[5]>=1)
                {
                    currentstate.ScoreSmallStraight.isSelectable = true
                    currentstate.ScoreSmallStraight.currentValue = 30
                }
            }
            // As the sequence must contain one each dice value, only a straight foward check of the value count of two possible sequence is needed
            if (!currentstate.ScoreLargeStraight.isFilled1) {
                if (diceValueCount[0]==1 && diceValueCount[1]==1 && diceValueCount[2]==1 && diceValueCount[3]==1 && diceValueCount[4]==1)
                || (diceValueCount[1]==1 && diceValueCount[2]==1 && diceValueCount[3]==1 && diceValueCount[4]==1 && diceValueCount[5]==1)
                {
                    currentstate.ScoreLargeStraight.isSelectable = true
                    currentstate.ScoreLargeStraight.currentValue = 40
                }
            }
        }
        
    }
    func chanceScoreCal() {
        if (currentstate.isP2 && !currentstate.ScoreChance.isFilled2) {
                //Calculate using the sum of value
                currentstate.ScoreChance.currentValue =
                    1 * currentstate.diceValueCount[0] + 2 * currentstate.diceValueCount[1]
                  + 3 * currentstate.diceValueCount[2] + 4 * currentstate.diceValueCount[3]
                  + 5 * currentstate.diceValueCount[4] + 6 * currentstate.diceValueCount[5]
        } else {
            if (!currentstate.ScoreChance.isFilled1) {
                //Calculate using the sum of value
                currentstate.ScoreChance.currentValue =
                    1 * currentstate.diceValueCount[0] + 2 * currentstate.diceValueCount[1]
                  + 3 * currentstate.diceValueCount[2] + 4 * currentstate.diceValueCount[3]
                  + 5 * currentstate.diceValueCount[4] + 6 * currentstate.diceValueCount[5]
            }
        }
        

    }

    func checkNoMove() {
        if (currentstate.ScoreChance.isSelectable) {
            chanceScoreCal()
        } else {
            if !currentstate.ScoreAce.isSelectable && !currentstate.ScoreTwo.isSelectable && !currentstate.ScoreThree.isSelectable
                && !currentstate.ScoreFour.isSelectable && !currentstate.ScoreFive.isSelectable && !currentstate.ScoreSix.isSelectable
                && !currentstate.ScoreThreeKind.isSelectable && !currentstate.ScoreFourKind.isSelectable && !currentstate.ScoreFullHouse.isSelectable
                && !currentstate.ScoreSmallStraight.isSelectable && !currentstate.ScoreLargeStraight.isSelectable && !currentstate.ScoreYahtzee.isSelectable
            {
                if (currentstate.isP2) {
                    if !currentstate.ScoreAce.isFilled2 {
                        currentstate.ScoreAce.currentValue = 0
                        currentstate.ScoreAce.isSelectable = true
                    }
                    if !currentstate.ScoreTwo.isFilled2 {
                        currentstate.ScoreTwo.currentValue = 0
                        currentstate.ScoreTwo.isSelectable = true
                    }
                    if !currentstate.ScoreThree.isFilled2 {
                        currentstate.ScoreThree.currentValue = 0
                        currentstate.ScoreThree.isSelectable = true
                    }
                    if !currentstate.ScoreFour.isFilled2 {
                        currentstate.ScoreFour.currentValue = 0
                        currentstate.ScoreFour.isSelectable = true
                    }
                    if !currentstate.ScoreFive.isFilled2 {
                        currentstate.ScoreFive.currentValue = 0
                        currentstate.ScoreFive.isSelectable = true
                    }
                    if !currentstate.ScoreSix.isFilled2 {
                        currentstate.ScoreSix.currentValue = 0
                        currentstate.ScoreSix.isSelectable = true
                    }
                    if !currentstate.ScoreThreeKind.isFilled2 {
                        currentstate.ScoreThreeKind.currentValue = 0
                        currentstate.ScoreThreeKind.isSelectable = true
                    }
                    if !currentstate.ScoreFourKind.isFilled2 {
                        currentstate.ScoreFourKind.currentValue = 0
                        currentstate.ScoreFourKind.isSelectable = true
                    }
                    if !currentstate.ScoreFullHouse.isFilled2 {
                        currentstate.ScoreFullHouse.currentValue = 0
                        currentstate.ScoreFullHouse.isSelectable = true
                    }
                    if !currentstate.ScoreSmallStraight.isFilled2 {
                        currentstate.ScoreSmallStraight.currentValue = 0
                        currentstate.ScoreSmallStraight.isSelectable = true
                    }
                    if !currentstate.ScoreLargeStraight.isFilled2 {
                        currentstate.ScoreLargeStraight.currentValue = 0
                        currentstate.ScoreLargeStraight.isSelectable = true
                    }
                    if !currentstate.ScoreYahtzee.isFilled2 {
                        currentstate.ScoreYahtzee.currentValue = 0
                        currentstate.ScoreYahtzee.isSelectable = true
                } else {
                    if !currentstate.ScoreAce.isFilled1 {
                        currentstate.ScoreAce.currentValue = 0
                        currentstate.ScoreAce.isSelectable = true
                    }
                    if !currentstate.ScoreTwo.isFilled1 {
                        currentstate.ScoreTwo.currentValue = 0
                        currentstate.ScoreTwo.isSelectable = true
                    }
                    if !currentstate.ScoreThree.isFilled1 {
                        currentstate.ScoreThree.currentValue = 0
                        currentstate.ScoreThree.isSelectable = true
                    }
                    if !currentstate.ScoreFour.isFilled1 {
                        currentstate.ScoreFour.currentValue = 0
                        currentstate.ScoreFour.isSelectable = true
                    }
                    if !currentstate.ScoreFive.isFilled1 {
                        currentstate.ScoreFive.currentValue = 0
                        currentstate.ScoreFive.isSelectable = true
                    }
                    if !currentstate.ScoreSix.isFilled1 {
                        currentstate.ScoreSix.currentValue = 0
                        currentstate.ScoreSix.isSelectable = true
                    }
                    if !currentstate.ScoreThreeKind.isFilled1 {
                        currentstate.ScoreThreeKind.currentValue = 0
                        currentstate.ScoreThreeKind.isSelectable = true
                    }
                    if !currentstate.ScoreFourKind.isFilled1 {
                        currentstate.ScoreFourKind.currentValue = 0
                        currentstate.ScoreFourKind.isSelectable = true
                    }
                    if !currentstate.ScoreFullHouse.isFilled1 {
                        currentstate.ScoreFullHouse.currentValue = 0
                        currentstate.ScoreFullHouse.isSelectable = true
                    }
                    if !currentstate.ScoreSmallStraight.isFilled1 {
                        currentstate.ScoreSmallStraight.currentValue = 0
                        currentstate.ScoreSmallStraight.isSelectable = true
                    }
                    if !currentstate.ScoreLargeStraight.isFilled1 {
                        currentstate.ScoreLargeStraight.currentValue = 0
                        currentstate.ScoreLargeStraight.isSelectable = true
                    }
                    if !currentstate.ScoreYahtzee.isFilled1 {
                        currentstate.ScoreYahtzee.currentValue = 0
                        currentstate.ScoreYahtzee.isSelectable = true
                    }
                }
                
                }
            }
        }
    }
        

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
                                   }.onAppear{
                                       chanceScoreCal()
                                       upperGroupCheck()
                                       checkDiceCombo()
                                       checkDiceSequence()
                                       checkNoMove()
                                       currentstate.Dice1.displayDice()
                                       currentstate.Dice2.displayDice()
                                       currentstate.Dice3.displayDice()
                                       currentstate.Dice4.displayDice()
                                       currentstate.Dice5.displayDice()
                                       //DEBUG Dice Value Count
                                       let _ = dump(currentstate.diceValueCount)
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
                                   Divider()
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
struct ScoreView_Previews: PreviewProvider {
    @State static var debugBool = true
    @State static var debugState = GameState(diceface1: "Dice1",
                                             diceface2: "Dice2",
                                             diceface3: "Dice3",
                                             diceface4: "Dice4",
                                             diceface5: "Dice5",
                                             diceValue: [1,1,1,1,1,0])
    static var previews: some View {
        ScoreView(currentstate: debugState,checkScoreSheet: $debugBool)
        .preferredColorScheme(.dark)
    }
}
