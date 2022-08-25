//
//  ContentView.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 18/08/2022.
//

import SwiftUI


struct DiceRollView: View {
    
    @StateObject var currentstate = GameState()
    @State var isOpenScoreSheet = false
    @State var isOpenInstruction = false
    
       
    

    /* Dice Comparision Functions*/
    func countDice() {
        for value in currentstate.allDiceValue {
            switch value {
              case 1:
                currentstate.diceValueCount[0] += 1
              case 2:
                currentstate.diceValueCount[1] += 1
              case 3:
                currentstate.diceValueCount[2] += 1
              case 4:
                currentstate.diceValueCount[3] += 1
              case 5:
                currentstate.diceValueCount[4] += 1
              case 6:
                currentstate.diceValueCount[5] += 1
              default:
                print("Dice Value Error")
            }
        }
    
    }

    func resetCounter() {
        currentstate.diceValueCount = [0,0,0,0,0,0]
        }
    
/* DICE Manipulation Functions*/
    func rolldice(){
        if (!currentstate.Dice1.isKept) {
            currentstate.Dice1.value = Int.random(in: 1...6)
            displayDice(myDice: currentstate.Dice1)
        }
        if (!currentstate.Dice2.isKept) {
            currentstate.Dice2.value = Int.random(in: 1...6)
            displayDice(myDice: currentstate.Dice2)
        }
        if (!currentstate.Dice3.isKept) {
            currentstate.Dice3.value = Int.random(in: 1...6)
            displayDice(myDice: currentstate.Dice3)
        }
        if (!currentstate.Dice4.isKept) {
            currentstate.Dice4.value = Int.random(in: 1...6)
            displayDice(myDice: currentstate.Dice4)
        }
        if (!currentstate.Dice5.isKept) {
            currentstate.Dice5.value = Int.random(in: 1...6)
            displayDice(myDice: currentstate.Dice5)
        }
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
        if (currentstate.Dice1.isKept) {
            currentstate.Dice1.isLocked = true
        }
        if (currentstate.Dice2.isKept) {
            currentstate.Dice2.isLocked = true
        }
        if (currentstate.Dice3.isKept) {
            currentstate.Dice3.isLocked = true
        }
        if (currentstate.Dice4.isKept) {
            currentstate.Dice4.isLocked = true
        }
        if (currentstate.Dice5.isKept) {
            currentstate.Dice5.isLocked = true
        }
    }

    
    //VIEW BODY 
    
    var body: some View {


        ZStack {
            VStack {
                HStack {
                    //Text(String(Dice1.value))
                    //print("Debug check 3: " + String(Dice1.value))
                    Spacer()
                    Button {chooseDice(myDice: currentstate.Dice1)} label: {Image(currentstate.Dice1.image)}
                    Button {chooseDice(myDice: currentstate.Dice2)} label: {Image(currentstate.Dice2.image)}
                    Button {chooseDice(myDice: currentstate.Dice3)} label: {Image(currentstate.Dice3.image)}
                    Button {chooseDice(myDice: currentstate.Dice4)} label: {Image(currentstate.Dice4.image)}
                    Button {chooseDice(myDice: currentstate.Dice5)} label: {Image(currentstate.Dice5.image)}
                    Spacer()
                    //print("Debug check 4: " + String(Dice1.value))
                }
                Button {
                    //print("DEBUG Button")
                    //print(String(Dice1.value))
                    //print(Dice1.image)
                    currentstate.allDiceValue.removeAll()
                    lockDice()
                    rolldice()
                    currentstate.allDiceValue.append(contentsOf: [currentstate.Dice1.value,
                                                                  currentstate.Dice2.value,
                                                                  currentstate.Dice3.value,
                                                                  currentstate.Dice4.value,
                                                                  currentstate.Dice5.value])
                    //dump(allDiceValue)
                } label: {
                    Text("Roll Dice")
                }.buttonStyle(.bordered)
                Button {
                    isOpenScoreSheet.toggle()
                    countDice()
                } label: {
                    Text("Open Score Board")
                    
                }.sheet(isPresented: $isOpenScoreSheet){
                    ScoreView(currentstate: currentstate, checkScoreSheet: $isOpenScoreSheet)
                }.buttonStyle(.bordered)
        //        HStack {
        //            Button("Sign In", action: rolldice())
        //            Button("Register", action: rolldice())
        //        }
                

            }
            }
        }


}

struct DiceRollView_Previews: PreviewProvider {
    static var previews: some View {
        DiceRollView()
    }
}
