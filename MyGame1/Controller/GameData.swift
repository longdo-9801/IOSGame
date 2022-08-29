//
//  GameData.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 25/08/2022.
//

import Foundation

class GameState : ObservableObject {
    
    //Store Game setting
    @Published var turnNumber : Int //To determine the current., if it reach 14, the game end
    @Published var is2PlayerMode : Bool //Flag to check if the game is in two player mode
    @Published var isP2: Bool //Flag to check if it's Player two turn
    @Published var isEndRoll : Bool
    @Published var isEndGame: Bool
    @Published var numberOfRoll: Int
    @Published var cheatVar: Int // A var for forcing the view to update
    @Published var isStart : Bool
    @Published var isResetToggle : Bool
    @Published var workaround : Int = 0
    //Store Dice Value
    @Published var allDiceValue : Array<Int>
    @Published var diceValueCount : Array<Int>
    @Published var Dice1 : Dice
    @Published var Dice2: Dice
    @Published var Dice3 : Dice
    @Published var Dice4 : Dice
    @Published var Dice5 : Dice
    
    //Store Score Sheet data
    ////Upper group
    @Published var ScoreAce : ScoreGroup
    @Published var ScoreTwo : ScoreGroup
    @Published var ScoreThree : ScoreGroup
    @Published var ScoreFour : ScoreGroup
    @Published var ScoreFive : ScoreGroup
    @Published var ScoreSix : ScoreGroup

    ////Lower Score Group
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
        self.turnNumber = 1
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
        self.turnNumber = 1
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
        if turnNumber > 13 {
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
    
    func fullReset() {
        self.Dice1 = Dice(id: 1, value: 0, image: "DiceDefault")
        self.Dice2 = Dice(id: 2, value: 0, image: "DiceDefault")
        self.Dice3 = Dice(id: 3, value: 0, image: "DiceDefault")
        self.Dice4 = Dice(id: 4, value: 0, image: "DiceDefault")
        self.Dice5 = Dice(id: 5, value: 0, image: "DiceDefault")
        
        self.allDiceValue = Array(repeating: 0, count: 5)
        self.diceValueCount = Array(repeating: 0, count: 6)
        self.turnNumber = 1
        self.is2PlayerMode = false
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
        
        self.playerName1 = "Player1"
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
    
    /* Upper Group */
    //Check if player have the valid dice and the board has not been filled
    func upperGroupCheck() {
        if (!ScoreAce.isFilled1 && diceValueCount[0] > 0) {
            ScoreAce.isSelectable = true
            ScoreAce.currentValue = 1 * diceValueCount[0]
      }
        if (!ScoreTwo.isFilled1 && diceValueCount[1] > 0) {
            ScoreTwo.isSelectable = true
            ScoreTwo.currentValue = 2 * diceValueCount[1]
      }
        if (!ScoreThree.isFilled1 && diceValueCount[2] > 0) {
            ScoreThree.isSelectable = true
            ScoreThree.currentValue = 3 * diceValueCount[2]
      }
        if (!ScoreFour.isFilled1 && diceValueCount[3] > 0) {
            ScoreFour.isSelectable = true
            ScoreFour.currentValue = 4 * diceValueCount[3]
      }
        if (!ScoreFive.isFilled1 && diceValueCount[4] > 0) {
            ScoreFive.isSelectable = true
            ScoreFive.currentValue = 5 * diceValueCount[4]
      }
        if (!ScoreSix.isFilled1 && diceValueCount[5] > 0) {
            ScoreSix.isSelectable = true
            ScoreSix.currentValue = 6 * diceValueCount[5]
          
      }
    }
    
    /* Lower Group */
    //Function check eligability for Three kind,Four kind, Yahtzee and Full House which require multiple dice with the same value.
    func checkDiceCombo() {
        if (isP2) {
            for diceValue in diceValueCount {
                if (diceValue == 5) {
                if (!ScoreYahtzee.isFilled2) {
                    ScoreYahtzee.isSelectable = true
                    ScoreYahtzee.currentValue = 40
                }
                if (!ScoreThreeKind.isFilled2) {
                    ScoreThreeKind.isSelectable = true
                    sumDiceValue(scoreboard: ScoreThreeKind)
                }
                if (!ScoreFourKind.isFilled2) {
                    ScoreFourKind.isSelectable = true
                    sumDiceValue(scoreboard: ScoreFourKind)
                }

                } else if (diceValue == 4) {
                if (!ScoreThreeKind.isFilled2) {
                    ScoreThreeKind.isSelectable = true
                    sumDiceValue(scoreboard: ScoreThreeKind)
                }
                if (!ScoreFourKind.isFilled2) {
                    ScoreFourKind.isSelectable = true
                    sumDiceValue(scoreboard: ScoreFourKind)
                }

                } else if (diceValue == 3) {
                    if (!ScoreFullHouse.isFilled2) {
                        for diceValue2 in diceValueCount {
                            if (diceValue2 == 2) {
                                ScoreFullHouse.isSelectable = true
                                ScoreFullHouse.currentValue = 25
                            }
                        }
                    }
                    if (!ScoreThreeKind.isFilled2) {
                        ScoreThreeKind.isSelectable = true
                        sumDiceValue(scoreboard: ScoreThreeKind)
                    }
                }
            }
        } else {
            for diceValue in diceValueCount {
                if (diceValue == 5) {
                if (!ScoreYahtzee.isFilled1) {
                ScoreYahtzee.isSelectable = true
                ScoreYahtzee.currentValue = 40
                }
                if (!ScoreThreeKind.isFilled1) {
                    ScoreThreeKind.isSelectable = true
                    sumDiceValue(scoreboard: ScoreThreeKind)
                }
                if (!ScoreFourKind.isFilled1) {
                    ScoreFourKind.isSelectable = true
                    sumDiceValue(scoreboard: ScoreFourKind)
                }

                } else if (diceValue == 4) {
                if (!ScoreThreeKind.isFilled1) {
                    ScoreThreeKind.isSelectable = true
                    sumDiceValue(scoreboard: ScoreThreeKind)
                }
                if (!ScoreFourKind.isFilled1) {
                    ScoreFourKind.isSelectable = true
                    sumDiceValue(scoreboard: ScoreFourKind)
                }

                } else if (diceValue == 3) {
                    if (!ScoreFullHouse.isFilled1) {
                        for diceValue2 in diceValueCount {
                            if (diceValue2 == 2) {
                                ScoreFullHouse.isSelectable = true
                                ScoreFullHouse.currentValue = 25
                            }
                        }
                    }
                    if (!ScoreThreeKind.isFilled1) {
                        ScoreThreeKind.isSelectable = true
                        sumDiceValue(scoreboard: ScoreThreeKind)
                    }
                }
            }
        }
    }
    //Function to check for Small and Large Straigth which require having four and five dices with sequential value (1-2-3-4 or 3-4-5-6,etc..) repsectively
    func checkDiceSequence() {
        // Logic check explanation: As the sum of all value count is always 5 and there must be at least one of four sequential dice value
        //, if there are two values that appear twice, one of the remaining two value will be 0
        // Example : if there are 2x I, 2x II then either IV or III is equal to 0 which will stop the logic check
        if (isP2) {
            if (!ScoreSmallStraight.isFilled2) {
                if (diceValueCount[0]>=1 && diceValueCount[1]>=1 && diceValueCount[2]>=1 && diceValueCount[3]>=1)
                    || (diceValueCount[1]>=1 && diceValueCount[2]>=1 && diceValueCount[3]>=1 && diceValueCount[4]>=1)
                    || (diceValueCount[2]>=1 && diceValueCount[3]>=1 && diceValueCount[4]>=1 && diceValueCount[5]>=1)
                {
                    ScoreSmallStraight.isSelectable = true
                    ScoreSmallStraight.currentValue = 30
                }
            }
            // As the sequence must contain one each dice value, only a straight foward check of the value count of two possible sequence is needed
            if (!ScoreLargeStraight.isFilled2) {
                if (diceValueCount[0]==1 && diceValueCount[1]==1 && diceValueCount[2]==1 && diceValueCount[3]==1 && diceValueCount[4]==1)
                    || (diceValueCount[1]==1 && diceValueCount[2]==1 && diceValueCount[3]==1 && diceValueCount[4]==1 && diceValueCount[5]==1)
                {
                    ScoreLargeStraight.isSelectable = true
                    ScoreLargeStraight.currentValue = 40
                }
            }
        } else {
            if (!ScoreSmallStraight.isFilled1) {
                if (diceValueCount[0]>=1 && diceValueCount[1]>=1 && diceValueCount[2]>=1 && diceValueCount[3]>=1)
                    || (diceValueCount[1]>=1 && diceValueCount[2]>=1 && diceValueCount[3]>=1 && diceValueCount[4]>=1)
                    || (diceValueCount[2]>=1 && diceValueCount[3]>=1 && diceValueCount[4]>=1 && diceValueCount[5]>=1)
                {
                    ScoreSmallStraight.isSelectable = true
                    ScoreSmallStraight.currentValue = 30
                }
            }
            // As the sequence must contain one each dice value, only a straight foward check of the value count of two possible sequence is needed
            if (!ScoreLargeStraight.isFilled1) {
                if (diceValueCount[0]==1 && diceValueCount[1]==1 && diceValueCount[2]==1 && diceValueCount[3]==1 && diceValueCount[4]==1)
                    || (diceValueCount[1]==1 && diceValueCount[2]==1 && diceValueCount[3]==1 && diceValueCount[4]==1 && diceValueCount[5]==1)
                {
                    ScoreLargeStraight.isSelectable = true
                    ScoreLargeStraight.currentValue = 40
                }
            }
        }
        
    }
    //Use to calculate the point for Three Kind , Four Kind and Chance
    func sumDiceValue(scoreboard : ScoreGroup) {
        scoreboard.currentValue =
        1 * diceValueCount[0] + 2 * diceValueCount[1]
      + 3 * diceValueCount[2] + 4 * diceValueCount[3]
      + 5 * diceValueCount[4] + 6 * diceValueCount[5]
    }
    
    //Check if player still have a valid move, if not "allow" player to input 0 into a valid scoreboard
    func checkNoMove() {
        if (ScoreChance.isSelectable) {
            sumDiceValue(scoreboard: ScoreChance)
        } else {
            if !ScoreAce.isSelectable && !ScoreTwo.isSelectable && !ScoreThree.isSelectable
                && !ScoreFour.isSelectable && !ScoreFive.isSelectable && !ScoreSix.isSelectable
                && !ScoreThreeKind.isSelectable && !ScoreFourKind.isSelectable && !ScoreFullHouse.isSelectable
                && !ScoreSmallStraight.isSelectable && !ScoreLargeStraight.isSelectable && !ScoreYahtzee.isSelectable
            {
                print("DEBUG: No move")
                if (isP2) {
                    if !ScoreAce.isFilled2 {
                        ScoreAce.currentValue = 0
                        ScoreAce.isSelectable = true
                    }
                    if !ScoreTwo.isFilled2 {
                        ScoreTwo.currentValue = 0
                        ScoreTwo.isSelectable = true
                    }
                    if !ScoreThree.isFilled2 {
                        ScoreThree.currentValue = 0
                        ScoreThree.isSelectable = true
                    }
                    if !ScoreFour.isFilled2 {
                        ScoreFour.currentValue = 0
                        ScoreFour.isSelectable = true
                    }
                    if !ScoreFive.isFilled2 {
                        ScoreFive.currentValue = 0
                        ScoreFive.isSelectable = true
                    }
                    if !ScoreSix.isFilled2 {
                        ScoreSix.currentValue = 0
                        ScoreSix.isSelectable = true
                    }
                    if !ScoreThreeKind.isFilled2 {
                        ScoreThreeKind.currentValue = 0
                        ScoreThreeKind.isSelectable = true
                    }
                    if !ScoreFourKind.isFilled2 {
                        ScoreFourKind.currentValue = 0
                        ScoreFourKind.isSelectable = true
                    }
                    if !ScoreFullHouse.isFilled2 {
                        ScoreFullHouse.currentValue = 0
                        ScoreFullHouse.isSelectable = true
                    }
                    if !ScoreSmallStraight.isFilled2 {
                        ScoreSmallStraight.currentValue = 0
                        ScoreSmallStraight.isSelectable = true
                    }
                    if !ScoreLargeStraight.isFilled2 {
                        ScoreLargeStraight.currentValue = 0
                        ScoreLargeStraight.isSelectable = true
                    }
                    if !ScoreYahtzee.isFilled2 {
                        ScoreYahtzee.currentValue = 0
                        ScoreYahtzee.isSelectable = true
                    }
                } else {
                    if !ScoreAce.isFilled1 {
                        ScoreAce.currentValue = 0
                        ScoreAce.isSelectable = true
                    }
                    if !ScoreTwo.isFilled1 {
                        ScoreTwo.currentValue = 0
                        ScoreTwo.isSelectable = true
                    }
                    if !ScoreThree.isFilled1 {
                        ScoreThree.currentValue = 0
                        ScoreThree.isSelectable = true
                    }
                    if !ScoreFour.isFilled1 {
                        ScoreFour.currentValue = 0
                        ScoreFour.isSelectable = true
                    }
                    if !ScoreFive.isFilled1 {
                        ScoreFive.currentValue = 0
                        ScoreFive.isSelectable = true
                    }
                    if !ScoreSix.isFilled1 {
                        ScoreSix.currentValue = 0
                        ScoreSix.isSelectable = true
                    }
                    if !ScoreThreeKind.isFilled1 {
                        ScoreThreeKind.currentValue = 0
                        ScoreThreeKind.isSelectable = true
                    }
                    if !ScoreFourKind.isFilled1 {
                        ScoreFourKind.currentValue = 0
                        ScoreFourKind.isSelectable = true
                    }
                    if !ScoreFullHouse.isFilled1 {
                        ScoreFullHouse.currentValue = 0
                        ScoreFullHouse.isSelectable = true
                    }
                    if !ScoreSmallStraight.isFilled1 {
                        
                        ScoreSmallStraight.currentValue = 0
                        ScoreSmallStraight.isSelectable = true
                    }
                    if !ScoreLargeStraight.isFilled1 {
                
                        ScoreLargeStraight.currentValue = 0
                        ScoreLargeStraight.isSelectable = true
                    }
                    if !ScoreYahtzee.isFilled1 {
            
                        ScoreYahtzee.currentValue = 0
                        ScoreYahtzee.isSelectable = true
                    }
                }
                
                }
            
        }
    }
    
    
}
