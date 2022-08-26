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
    @Published var finalScore : Int
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
    
    init() {
        self.Dice1 = Dice(id: 1, value: 0, image: "DiceDefault")
        self.Dice2 = Dice(id: 2, value: 0, image: "DiceDefault")
        self.Dice3 = Dice(id: 3, value: 0, image: "DiceDefault")
        self.Dice4 = Dice(id: 4, value: 0, image: "DiceDefault")
        self.Dice5 = Dice(id: 5, value: 0, image: "DiceDefault")
        
        self.allDiceValue = Array(repeating: 0, count: 5)
        self.diceValueCount = Array(repeating: 0, count: 6)
        self.turnNummber = 0
        self.is2PlayerMode = false
        self.isP2 = false
        self.finalScore = 0
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
    }
    
    init(diceface1: String, diceface2: String, diceface3 : String, diceface4: String, diceface5: String, diceValue: Array<Int>) {
        self.Dice1 = Dice(id: 1, value: 0, image: diceface1)
        self.Dice2 = Dice(id: 2, value: 0, image: diceface2)
        self.Dice3 = Dice(id: 3, value: 0, image: diceface3)
        self.Dice4 = Dice(id: 4, value: 0, image: diceface4)
        self.Dice5 = Dice(id: 5, value: 0, image: diceface5)
        
        self.allDiceValue = Array(repeating: 0, count: 5)
        self.diceValueCount = diceValue
        self.turnNummber = 0
        self.is2PlayerMode = false
        self.isP2 = false
        self.finalScore = 0
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
    }
    
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
        resetDiceCounter()
        
    }
}
