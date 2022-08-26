//
//  ScoreTotalBox.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 26/08/2022.
//

import SwiftUI

struct ScoreTotalBoxView : View {
    @State var displayPoint = "0"
    @State var displayName = ""
    @ObservedObject var GameState : GameState
    @State var textColor : Color = .gray
    @State var isUpper: Bool
    
    
    func UpperCheckAllFill(){
        if GameState.isP2 {
            if GameState.ScoreAce.isFilled2 && GameState.ScoreTwo.isFilled2
            && GameState.ScoreThree.isFilled2 && GameState.ScoreFour.isFilled2
            && GameState.ScoreFive.isFilled2 && GameState.ScoreSix.isFilled2 {
                textColor = .black
                if GameState.upperScoreP2 >= 63 {displayPoint = "\(GameState.upperScoreP2) + Bonus: 35"}
                
        } else {
            if GameState.ScoreAce.isFilled1 && GameState.ScoreTwo.isFilled1
                && GameState.ScoreThree.isFilled1 && GameState.ScoreFour.isFilled1
                && GameState.ScoreFive.isFilled1 && GameState.ScoreSix.isFilled1 {
                textColor = .black
                if GameState.upperScoreP1 >= 63 {displayPoint = "\(GameState.upperScoreP1) + Bonus: 35"}
            }
        }
        }
        
    }
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
    
    func display(){
        if GameState.isP2 {
            if isUpper {
                displayPoint = String(GameState.upperScoreP2)
            } else {
                displayPoint = String(GameState.lowerScoreP2)
            }
        } else {
            if isUpper {
                displayPoint = String(GameState.upperScoreP1)
            } else {
                displayPoint = String(GameState.lowerScoreP1)
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
                    displayName = "Lower Group Total Score"
                }
            }
            Spacer(minLength: 100)
            Text(String(displayPoint)).foregroundColor(textColor).frame(alignment: .trailing).onAppear {
                if isUpper {
                    GameState.UpperCal()
                    
                } else {
                    GameState.LowerCal()
            }
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
            ScoreTotalBoxView(GameState: GameState(diceface1: "Dice1",
                                                    diceface2: "Dice2",
                                                    diceface3: "Dice3",
                                                    diceface4: "Dice4",
                                                    diceface5: "Dice5",
                                                    diceValue: [1,1,1,1,1,0]), isUpper: true)
        }
        
    }
}
