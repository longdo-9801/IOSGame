//
//  GameData.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 25/08/2022.
//

import Foundation

class GameState : ObservableObject {
    
    //Store Game setting
    @Published var turnNummber : Int
    @Published var is2PlayerMode : Bool
    @Published var isP2: Bool
    @Published var isEndRoll : Bool
    @Published var isEndGame: Bool
    @Published var numberOfRoll: Int
    @Published var cheatVar: Int
    @Published var isStart : Bool
    @Published var isResetToggle : Bool
    
    //Store Dice Value
    @Published var allDiceValue : Array<Int>
    @Published var diceValueCount : Array<Int>
    @Published var Dice1 : Dice
    @Published var Dice2: Dice
    @Published var Dice3 : Dice
    @Published var Dice4 : Dice
    @Published var Dice5 : Dice
    
    //Store Score Sheet data
    @Published var ScoreAce : ScoreGroup
    @Published var ScoreTwo : ScoreGroup
    @Published var ScoreThree : ScoreGroup
    @Published var ScoreFour : ScoreGroup
    @Published var ScoreFive : ScoreGroup
    @Published var ScoreSix : ScoreGroup

    //Lower Score Group
    @Published var ScoreThreeKind : ScoreGroup
    @Published var ScoreFourKind : ScoreGroup
    @Published var ScoreFullHouse : ScoreGroup
    @Published var ScoreSmallStraight : ScoreGroup
    @Published var ScoreLargeStraight : ScoreGroup
    @Published var ScoreYahtzee : ScoreGroup
    @Published var ScoreChance : ScoreGroup
    
    //Score vars
    @Published var playerName1 : String = "Default"
    @Published var playerName2 : String = ""
    @Published var finalScoreP1 : Int
    @Published var upperScoreP1 : Int
    @Published var lowerScoreP1 : Int
    @Published var finalScoreP2 : Int
    @Published var upperScoreP2 : Int
    @Published var lowerScoreP2 : Int
    
    init(isPlayer2 : Bool, Player1 : String, Player2 : String?) {
        self.Dice1 = Dice(id: 1, value: 0, image: "DiceDefault")
        self.Dice2 = Dice(id: 2, value: 0, image: "DiceDefault")
        self.Dice3 = Dice(id: 3, value: 0, image: "DiceDefault")
        self.Dice4 = Dice(id: 4, value: 0, image: "DiceDefault")
        self.Dice5 = Dice(id: 5, value: 0, image: "DiceDefault")
        
        self.allDiceValue = Array(repeating: 0, count: 5)
        self.diceValueCount = Array(repeating: 0, count: 6)
        self.turnNummber = 1
        self.is2PlayerMode = isPlayer2
        self.isP2 = false
        self.cheatVar = 0
        
        self.isStart = true
        self.isEndRoll = false
        self.isEndGame = false
        self.numberOfRoll = 3
        self.isResetToggle = false
        
        self.ScoreAce = ScoreGroup(name: "Aces", selectState : false)
        self.ScoreTwo = ScoreGroup(name: "Twos", selectState : false)
        self.ScoreThree = ScoreGroup(name: "Threes", selectState : false)
        self.ScoreFour = ScoreGroup(name: "Fours", selectState : false)
        self.ScoreFive = ScoreGroup(name: "Fives", selectState : false)
        self.ScoreSix = ScoreGroup(name: "Sixes", selectState : false)

        self.ScoreThreeKind = ScoreGroup(name: "Three of a Kind", selectState : false)
        self.ScoreFourKind = ScoreGroup(name: "Four of a Kind", selectState : false)
        self.ScoreFullHouse = ScoreGroup(name: "Full House", selectState : false)
        self.ScoreSmallStraight = ScoreGroup(name: "Small Straight", selectState : false)
        self.ScoreLargeStraight = ScoreGroup(name: "Large Straight", selectState : false)
        self.ScoreYahtzee = ScoreGroup(name: "Yahtzee", selectState : false)
        self.ScoreChance = ScoreGroup(name: "Chance", selectState : true)
        
        self.finalScoreP1 = 0
        self.upperScoreP1 = 0
        self.lowerScoreP1 = 0
        self.finalScoreP2 = 0
        self.upperScoreP2 = 0
        self.lowerScoreP2 = 0
        
        self.playerName1 = Player1
        if is2PlayerMode {
            self.playerName2 = Player2!
        }
        
    }
    
    init(dice1: Int, dice2: Int, dice3: Int, dice4: Int, dice5: Int, diceValue: Array<Int>) {
        self.Dice1 = Dice(id: 1, value: dice1, image: "Dice1")
        self.Dice2 = Dice(id: 2, value: dice2, image: "Dice2")
        self.Dice3 = Dice(id: 3, value: dice3, image: "Dice3")
        self.Dice4 = Dice(id: 4, value: dice4, image: "Dice4")
        self.Dice5 = Dice(id: 5, value: dice5, image: "Dice5")
        
        self.allDiceValue = Array(repeating: 0, count: 5)
        self.diceValueCount = diceValue
        self.turnNummber = 1
        self.is2PlayerMode = false
        self.isP2 = false
        self.cheatVar = 0
    
        self.numberOfRoll = 0
        self.isStart = true
        self.isEndRoll = false
        self.isEndGame = false
        self.isResetToggle = false
        
        self.ScoreAce = ScoreGroup(name: "Aces", selectState : false)
        self.ScoreTwo = ScoreGroup(name: "Twos", selectState : false)
        self.ScoreThree = ScoreGroup(name: "Threes", selectState : false)
        self.ScoreFour = ScoreGroup(name: "Fours", selectState : false)
        self.ScoreFive = ScoreGroup(name: "Fives", selectState : false)
        self.ScoreSix = ScoreGroup(name: "Sixes", selectState : false)

        self.ScoreThreeKind = ScoreGroup(name: "Three of a Kind", selectState : false)
        self.ScoreFourKind = ScoreGroup(name: "Four of a Kind", selectState : false)
        self.ScoreFullHouse = ScoreGroup(name: "Full House", selectState : false)
        self.ScoreSmallStraight = ScoreGroup(name: "Small Straight", selectState : false)
        self.ScoreLargeStraight = ScoreGroup(name: "Large Straight", selectState : false)
        self.ScoreYahtzee = ScoreGroup(name: "Yahtzee", selectState : false)
        self.ScoreChance = ScoreGroup(name: "Chance", selectState : true)
        
        self.finalScoreP1 = 0
        self.upperScoreP1 = 0
        self.lowerScoreP1 = 0
        self.finalScoreP2 = 0
        self.upperScoreP2 = 0
        self.lowerScoreP2 = 0

    }
    
    //Game state checker
    func checkEndRoll() {
        if numberOfRoll == 0 {
            self.isEndRoll = true
        } else if numberOfRoll == 3 {
            self.isEndRoll = false
        }
    }
    
    func checkEndGame() {
        if turnNummber == 14 {
            self.isEndGame = true
        }
    }
    
    /* Dice Comparision Functions*/
    func countDice() {
        resetDiceCounter()
        for value in self.allDiceValue {
            switch value {
              case 1:
                self.diceValueCount[0] += 1
              case 2:
                self.diceValueCount[1] += 1
              case 3:
                self.diceValueCount[2] += 1
              case 4:
                self.diceValueCount[3] += 1
              case 5:
                self.diceValueCount[4] += 1
              case 6:
                self.diceValueCount[5] += 1
              default:
                print("Dice Value Error")
            }
        }
    
    }
    func resetDiceCounter() {
        diceValueCount = [0,0,0,0,0,0]
    }
    
    func resetState() {
        isResetToggle = false
        isStart = true
        isEndRoll = false
        numberOfRoll = 3
        Dice1.resetDice()
        Dice2.resetDice()
        Dice3.resetDice()
        Dice4.resetDice()
        Dice5.resetDice()
        ScoreAce.resetGroup()
        ScoreTwo.resetGroup()
        ScoreThree.resetGroup()
        ScoreFour.resetGroup()
        ScoreFive.resetGroup()
        ScoreSix.resetGroup()
        ScoreThreeKind.resetGroup()
        ScoreFourKind.resetGroup()
        ScoreFullHouse.resetGroup()
        ScoreSmallStraight.resetGroup()
        ScoreLargeStraight.resetGroup()
        ScoreYahtzee.resetGroup()
        ScoreChance.currentValue = 0
        resetDiceCounter()
        if is2PlayerMode {
            if isP2 {
                isP2 = false
            } else {
                isP2 = true
            }
        }
        
    }
    //Score sum functions
    func UpperCal() {
        if is2PlayerMode {
            upperScoreP2 = ScoreAce.finalValue2
                          + ScoreFour.finalValue2
                          + ScoreTwo.finalValue2
                          + ScoreThree.finalValue2
                          + ScoreFive.finalValue2
                          + ScoreSix.finalValue2
        }
        upperScoreP1 = ScoreAce.finalValue1
                    + ScoreTwo.finalValue1
                    + ScoreThree.finalValue1
                    + ScoreFour.finalValue1
                    + ScoreFive.finalValue1
                    + ScoreSix.finalValue1
    }
    
    func LowerCal(){
        if is2PlayerMode {
            lowerScoreP2 = ScoreYahtzee.finalValue2
                + ScoreThreeKind.finalValue2
                + ScoreFourKind.finalValue2
                + ScoreFullHouse.finalValue2
                + ScoreSmallStraight.finalValue2
                + ScoreLargeStraight.finalValue2
                + ScoreChance.finalValue2
        }
        lowerScoreP1 = ScoreYahtzee.finalValue1
            + ScoreThreeKind.finalValue1
            + ScoreFourKind.finalValue1
            + ScoreFullHouse.finalValue1
            + ScoreSmallStraight.finalValue1
            + ScoreLargeStraight.finalValue1
            + ScoreChance.finalValue1

    }
    
    func finalCal() {
        if is2PlayerMode {
            finalScoreP2 = upperScoreP2 + lowerScoreP2
            if upperScoreP2 >= 63 {
                finalScoreP2 += 35
            }
        }
        finalScoreP1 = upperScoreP1 + lowerScoreP1
        if upperScoreP1 >= 63 {
            finalScoreP1 += 35
        }
        
    }
    
    
}
