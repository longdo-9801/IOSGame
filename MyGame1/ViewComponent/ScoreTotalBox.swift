//
//  ScoreTotalBox.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 26/08/2022.
//

import SwiftUI

//To show the total score of each groups of score
struct ScoreTotalBoxView : View {
    @State var displayPoint = "0"
    @State var displayName = ""
    @ObservedObject var GameState : GameState
    @State var textColor : Color = .gray
    @State var isUpper: Bool
    
    //Use to check if all upper group are filled, supposed to turn the text black, not working
    func UpperCheckAllFill(){
        if GameState.isP2 {
            if GameState.ScoreAce.isFilled2 && GameState.ScoreTwo.isFilled2
            && GameState.ScoreThree.isFilled2 && GameState.ScoreFour.isFilled2
            && GameState.ScoreFive.isFilled2 && GameState.ScoreSix.isFilled2 {
                textColor = .black
                if GameState.upperScoreP2 >= 63 {
                    displayPoint = "\(GameState.upperScoreP2) + Bonus: 35"
                }
                
        } else {
            if GameState.ScoreAce.isFilled1 && GameState.ScoreTwo.isFilled1
                && GameState.ScoreThree.isFilled1 && GameState.ScoreFour.isFilled1
                && GameState.ScoreFive.isFilled1 && GameState.ScoreSix.isFilled1 {
                textColor = .black
                if GameState.upperScoreP1 >= 63 {
                    displayPoint = "\(GameState.upperScoreP1) + Bonus: 35"
                }
            }
        }
        }
        
    }
    //Use to check if all lower group are filled, supposed to turn the text black, not working
    func LowerCheckAllFill(){
        if GameState.isP2 {
            if GameState.ScoreThreeKind.isFilled2 && GameState.ScoreFourKind.isFilled2
                && GameState.ScoreFullHouse.isFilled2 && GameState.ScoreSmallStraight.isFilled2
                && GameState.ScoreLargeStraight.isFilled2 && GameState.ScoreYahtzee.isFilled2
                && GameState.ScoreChance.isFilled2 {
                textColor = .black
        } else {
            if GameState.ScoreThreeKind.isFilled1 && GameState.ScoreFourKind.isFilled1
                && GameState.ScoreFullHouse.isFilled1 && GameState.ScoreSmallStraight.isFilled1
                && GameState.ScoreLargeStraight.isFilled1 && GameState.ScoreYahtzee.isFilled1
                && GameState.ScoreChance.isFilled1 {
                textColor = .black
            }
        }
        
        }
        
    }
    //Update the value of score
    func display(){
        if GameState.isP2 {
            if isUpper {
                displayPoint = String(GameState.upperScoreP2)
                UpperCheckAllFill()
            } else {
                displayPoint = String(GameState.lowerScoreP2)
                LowerCheckAllFill()
            }
        } else {
            if isUpper {
                displayPoint = String(GameState.upperScoreP1)
                UpperCheckAllFill()
            } else {
                displayPoint = String(GameState.lowerScoreP1)
                LowerCheckAllFill()
            }
        }
        
    }
    
    
    
    var body: some View {
        HStack (spacing : 0) {
                //Spacer()
            Text(displayName).frame(alignment: .leading).onAppear{
                if isUpper {
                    displayName = "Upper Group Total Score: "
                } else {
                    displayName = "Lower Group Total Score: "
                }
            }
            Spacer(minLength: 100)
            Text(String(displayPoint)).foregroundColor(textColor).frame(alignment: .trailing).onAppear {
                if isUpper {
                    GameState.UpperCal()
                } else {
                    GameState.LowerCal()
            }
                display()
            }
            Spacer().frame(width: 30)
            
        }
        
    }
        
}

struct ScoreTotalBoxViewPreview: PreviewProvider {
    @State static var debugBool1 = true
    @State static var debugBool2 = false
    static var previews: some View {
        ZStack {
            Color.white
            ScoreTotalBoxView(GameState: GameState(dice1: 1,
                                                   dice2: 2,
                                                   dice3: 3,
                                                   dice4: 4,
                                                   dice5: 5,
                                                   diceValue: [1,1,1,1,1,0]), isUpper: true)
        }
        
    }
}
