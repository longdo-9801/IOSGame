//
//  ContentView.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 18/08/2022.
//

import SwiftUI


struct ContentView: View {

//    @State var diceValue1 = 1
//    @State var diceValue2 = 1
//    @State var diceValue3 = 1
//    @State var diceValue4 = 1
//    @State var diceValue5 = 1
//    @State var diceImage1 : String = "Dice1"
//    @State var diceImage2 : String = "Dice1"
//    @State var diceImage3 : String = "Dice1"
//    @State var diceImage4 : String = "Dice1"
//    @State var diceImage5 : String = "Dice1"
//    @State var keepDice1 = false
//    @State var keepDice2 = false
//    @State var keepDice3 = false
//    @State var keepDice4 = false
//    @State var keepDice5 = false

    @StateObject var Dice1 = Dice(id: 1, value: 1, image: "Dice1")
    @StateObject var Dice2 = Dice(id: 2, value: 1, image: "Dice1")
    @StateObject var Dice3 = Dice(id: 3, value: 1, image: "Dice1")
    @StateObject var Dice4 = Dice(id: 4, value: 1, image: "Dice1")
    @StateObject var Dice5 = Dice(id: 5, value: 1, image: "Dice1")
    
    @State var allDiceValue = Array(repeating: 0, count: 5)
    @State var diceValueCount = Array(repeating: 0, count: 6)
    @State var turnNummber : Int = 0
    
    //Upper Score Group
    @StateObject var ScoreAce = ScoreGroup(name: "Aces", selectState : false)
    @StateObject var ScoreTwo = ScoreGroup(name: "Twos", selectState : false)
    @StateObject var ScoreThree = ScoreGroup(name: "Threes", selectState : false)
    @StateObject var ScoreFour = ScoreGroup(name: "Fours", selectState : false)
    @StateObject var ScoreFive = ScoreGroup(name: "Fives", selectState : false)
    @StateObject var ScoreSix = ScoreGroup(name: "Sixes", selectState : false)
    //Lower Score Group
    @StateObject var ScoreThreeKind = ScoreGroup(name: "Three of a Kind", selectState : false)
    @StateObject var ScoreFourKind = ScoreGroup(name: "Four of a Kind", selectState : false)
    @StateObject var ScoreFullHouse = ScoreGroup(name: "Full House", selectState : false)
    @StateObject var ScoreSmallStraight = ScoreGroup(name: "SmallStraight", selectState : false)
    @StateObject var ScoreLargeStraight = ScoreGroup(name: "LargeStraight", selectState : false)
    @StateObject var ScoreYahtzee = ScoreGroup(name: "Yahtzee", selectState : false)
    @StateObject var ScoreChance = ScoreGroup(name: "Chance", selectState : true)
    
    
/* DICE Manipulation Functions*/
    func rolldice(){
        if (!Dice1.isKept) {
            Dice1.value = Int.random(in: 1...6)
            displayDice(myDice: Dice1)
        }
        if (!Dice2.isKept) {
            Dice2.value = Int.random(in: 1...6)
            displayDice(myDice: Dice2)
        }
        if (!Dice3.isKept) {
            Dice3.value = Int.random(in: 1...6)
            displayDice(myDice: Dice3)
        }
        if (!Dice4.isKept) {
            Dice4.value = Int.random(in: 1...6)
            displayDice(myDice: Dice4)
        }
        if (!Dice5.isKept) {
            Dice5.value = Int.random(in: 1...6)
            displayDice(myDice: Dice5)
        }
//        print("Debug check Roll 1: " + String(Dice1.value))
//        Dice1.value = Int.random(in: 1...6)
//        print("Debug check Roll 2: " + String(Dice1.value))
    }
    
    func displayDice(myDice : Dice) {
        //print("DEBUG CHECK IMAGE 1: " + myDice.image)
        switch  myDice.value {
        case 1:
            myDice.image = "Dice1"
        case 2:
            myDice.image = "Dice2"
        case 3:
            myDice.image = "Dice3"
        case 4:
            myDice.image = "Dice4"
        case 5:
            myDice.image = "Dice5"
        case 6:
            myDice.image = "Dice6"
            
        default:
           print("Dice Value Error")
        }
        //print("DEBUG CHECK IMAGE 2: " + myDice.image)
    }
    func displayDiceOff(myDice : Dice) {
        //print("DEBUG CHECK IMAGE 1: " + myDice.image)
        switch  myDice.value {
        case 1:
            myDice.image = "Dice1-Off"
        case 2:
            myDice.image = "Dice2-Off"
        case 3:
            myDice.image = "Dice3-Off"
        case 4:
            myDice.image = "Dice4-Off"
        case 5:
            myDice.image = "Dice5-Off"
        case 6:
            myDice.image = "Dice6-Off"
            
        default:
           print("Dice Value Error")
        }
        //print("DEBUG CHECK IMAGE 2: " + myDice.image)
    }
    
    func chooseDice(myDice: Dice) {
        if (myDice.isLocked)
        {
            
        }
        else if (myDice.isKept) {
            displayDice(myDice: myDice)
            myDice.isKept = false
        } else {
            displayDiceOff(myDice: myDice)
            myDice.isKept = true
        }
    }
    
    func lockDice() {
        if (Dice1.isKept) {
            Dice1.isLocked = true
        }
        if (Dice2.isKept) {
            Dice2.isLocked = true
        }
        if (Dice3.isKept) {
            Dice3.isLocked = true
        }
        if (Dice4.isKept) {
            Dice4.isLocked = true
        }
        if (Dice5.isKept) {
            Dice5.isLocked = true
        }
    }
/* Dice Comparision Functions*/
    func countDice() {
        for value in allDiceValue {
            switch value {
              case 1:
                diceValueCount[0] += 1
              case 2:
                diceValueCount[1] += 1
              case 3:
                diceValueCount[2] += 1
              case 4:
                diceValueCount[3] += 1
              case 5:
                diceValueCount[4] += 1
              case 6:
                diceValueCount[5] += 1  
              default: 
                print("Dice Value Error")
            }
        }
    
    }

    func resetCounter() {
      diceValueCount = [0,0,0,0,0,0]
    }

    /* Upper Group */
    func upperGroupCheck() {
      if (!ScoreAce.isFilled && diceValueCount[0] > 0) {
        ScoreAce.isSelectable = true
        ScoreAce.isSelectable.displayValue = 1 * diceValueCount[0]
      }
      if (!ScoreTwo.isFilled && diceValueCount[2] > 0) {
        ScoreTwo.isSelectable = true
        ScoreTwo.isSelectable.displayValue = 2 * diceValueCount[1]
      }
      if (!ScoreThree.isFilled && diceValueCount[3] > 0) {
        ScoreThree.isSelectable = true
        ScoreThree.isSelectable.displayValue = 3 * diceValueCount[2]
      }
      if (!ScoreFour.isFilled && diceValueCount[4] > 0) {
        ScoreFour.isSelectable = true
        ScoreFour.isSelectable.displayValue = 4 * diceValueCount[3]
      }
      if (!ScoreFive.isFilled && diceValueCount[5] > 0) {
        ScoreFive.isSelectable = true
        ScoreFive.isSelectable.displayValue = 5 * diceValueCount[4]
      }
      if (!ScoreSix.isFilled && diceValueCount[6] > 0) {
        ScoreSix.isSelectable = true
        ScoreSix.isSelectable.displayValue = 6 * diceValueCount[5]
      }
    }
        
    }
    /* Lower Group */   
    func checkDiceCombo() {
      var valueIndex: Int = 1
      for diceValue in diceValueCount {
        if (diceValue == 5) {
            if (!ScoreYahtzee.isFilled) {
                ScoreYahtzee.isSelectable = true
                ScoreYahtzee.currentValue = 40
            }
            if (!ScoreThreeKind.isFilled) {
                ScoreThreeKind.isSelectable = true
                ScoreThreeKind.currentValue = valueIndex * 3
            }
            if (!ScoreFourKind.isFilled) {
                ScoreFourKind.isSelectable = true
                ScoreFourKind.currentValue = valueIndex * 4
            }
            
        } else if (diceValue == 4) {
            if (!ScoreThreeKind.isFilled) {
                ScoreThreeKind.isSelectable = true
                ScoreThreeKind.currentValue = valueIndex * 3
            }
            if (!ScoreFourKind.isFilled) {
                ScoreFourKind.isSelectable = true
                ScoreFourKind.currentValue = valueIndex * 4
            }
            
        } else if (diceValue == 3) { 
            if (!ScoreFullHouse.isFilled) {
                for diceValue2 in diceValueCount {
                    if (diceValue2 == 2) {
                        ScoreFullHouse.isSelectable = true
                        ScoreFullHouse.currentValue = 25
                    }
                }
            }
            if (!ScoreThreeKind.isFilled) {
                ScoreThreeKind.isSelectable = true
                ScoreThreeKind.currentValue = valueIndex * 3
            }
            
        }
        //DEBUG CODE//print("Index position: \(valueIndex) Value: \(diceValue)")
        valueIndex += 1
      }
    }
    func checkDiceSequence() {
        // Logic check explanation: As the sum of all value count is always 5 and there must be at least one of four sequential dice value
        //, if there are two values that appear twice, one of the remaining two value will be 0
        // Example : if there are 2x I, 2x II then either IV or III is equal to 0 which will stop the logic check
        if (!ScoreSmallStraight.isFilled) {
            if (diceValueCount[0]>=1 && diceValueCount[1]>=1 && diceValueCount[2]>=1 && diceValueCount[3]>=1) 
            || (diceValueCount[1]>=1 && diceValueCount[2]>=1 && diceValueCount[3]>=1 && diceValueCount[4]>=1) 
            || (diceValueCount[2]>=1 && diceValueCount[3]>=1 && diceValueCount[4]>=1 && diceValueCount[5]>=1)
            {
                ScoreSmallStraight.isSelectable = true
                ScoreSmallStraight.currentValue = 30
            }
        }
        // As the sequence must contain one each dice value, only a straight foward check of the value count of two possible sequence is needed
        if (!ScoreLargeStraight.isFilled) {
            if (diceValueCount[0]==1 && diceValueCount[1]==1 && diceValueCount[2]==1 && diceValueCount[3]==1 && diceValueCount[4]==1) 
            || (diceValueCount[1]==1 && diceValueCount[2]==1 && diceValueCount[3]==1 && diceValueCount[4]==1 && diceValueCount[5]==1) 
            {
                ScoreLargeStraight.isSelectable = true
                ScoreLargeStraight.currentValue = 40
            }
        }
    }
    func chanceScoreCal() {
        if (!ScoreChance.isFilled) {
            var sumvalue = 0
            for value in allDiceValue {
                sumvalue += value
            }
            ScoreChance.currentValue = sumvalue
        }

    }

    func noMoveCheck() {
        if (ScoreChance.isSelectable) {
            chanceScoreCal()
            ScoreChance.isSelectable = false
            ScoreChance.isFilled = true
        } else { 
            if !ScoreAce.isSelectable && !ScoreTwo.isSelectable && !ScoreThree.isSelectable 
            && !ScoreFour.isSelectable && !ScoreFive.isSelectable && !ScoreSix.isSelectable
            && !ScoreThreeKind.isSelectable && !ScoreFourKind.isSelectable && !ScoreFullHouse
            && !ScoreSmallStraight.isSelectable && !ScoreLargeStraight.isSelectable && !ScoreYahtzee.isSelectable
            {
                  if (!ScoreAce.isFilled) {
                    ScoreAce.currentValue = 0
                    ScoreAce.isSelectable = true
                  }
                  if (!ScoreTwo.isFilled) {
                      ScoreAce.currentValue = 0
                    ScoreAce.isSelectable = true
                  }
                  if (!ScoreThree.isFilled) {
                      ScoreAce.currentValue = 0
                    ScoreAce.isSelectable = true
                  }
                  if (!ScoreFour.isFilled) {
                      ScoreAce.currentValue = 0
                    ScoreAce.isSelectable = true
                  }
                  if (!ScoreFive.isFilled) {
                      ScoreAce.currentValue = 0
                    ScoreAce.isSelectable = true
                  }
                  if (!ScoreSix.isFilled) {
                      ScoreAce.currentValue = 0
                    ScoreAce.isSelectable = true
                  }
            }
        }
	
       

    }
    
    
    
    var body: some View {


        ZStack {
            VStack {
                HStack {
                    //Text(String(Dice1.value))
                    //print("Debug check 3: " + String(Dice1.value))
                    Spacer()
                    Button {chooseDice(myDice: Dice1)} label: {Image(Dice1.image)}
                    Button {chooseDice(myDice: Dice2)} label: {Image(Dice2.image)}
                    Button {chooseDice(myDice: Dice3)} label: {Image(Dice3.image)}
                    Button {chooseDice(myDice: Dice4)} label: {Image(Dice4.image)}
                    Button {chooseDice(myDice: Dice5)} label: {Image(Dice5.image)}
                    Spacer()
                    //print("Debug check 4: " + String(Dice1.value))
                }
                Button {
                    //print("DEBUG Button")
                    //print(String(Dice1.value))
                    //print(Dice1.image)
                    allDiceValue.removeAll()
                    lockDice()
                    rolldice()
                    allDiceValue.append(contentsOf: [Dice1.value,Dice2.value,Dice3.value,Dice4.value,Dice5.value])
                    //dump(allDiceValue)
                } label: {
                    Text("Roll Dice")

                }
        //        HStack {
        //            Button("Sign In", action: rolldice())
        //            Button("Register", action: rolldice())
        //        }
                .buttonStyle(.bordered)

            }
            }
        }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
