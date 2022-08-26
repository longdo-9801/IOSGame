//
//  ContentView.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 18/08/2022.
//

import SwiftUI


struct DiceRollView: View {
    
    @StateObject var currentstate : GameState
    @State var isOpenScoreSheet = false
    @State var isOpenInstruction = false
    @State var isEndGame = false
    
       
    

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
    
/* DICE Manipulation Functions*/
    func rolldice(){
        if currentstate.isStart {
            currentstate.isStart = false
        }
        if (!currentstate.Dice1.isKept) {
            currentstate.Dice1.value = Int.random(in: 1...6)
            currentstate.Dice1.displayDice()
        }
        if (!currentstate.Dice2.isKept) {
            currentstate.Dice2.value = Int.random(in: 1...6)
            currentstate.Dice2.displayDice()
        }
        if (!currentstate.Dice3.isKept) {
            currentstate.Dice3.value = Int.random(in: 1...6)
            currentstate.Dice3.displayDice()
        }
        if (!currentstate.Dice4.isKept) {
            currentstate.Dice4.value = Int.random(in: 1...6)
            currentstate.Dice4.displayDice()
        }
        if (!currentstate.Dice5.isKept) {
            currentstate.Dice5.value = Int.random(in: 1...6)
            currentstate.Dice5.displayDice()
        }
    }

    // Basic function to change a dice status from free to kept. See func lockDice for the purpose of kept status.
    //If dice is already lock, the function end. If not, the function will change the status from free to lock and vice versa.
    func chooseDice(myDice: Dice) {
        if (myDice.isLocked)
        {
            
        }
        else if (!myDice.isKept && myDice.value != 0) {
            myDice.displayDiceOff()
            myDice.isKept = true
            currentstate.cheatVar += 1
        } else if (myDice.isKept){
            myDice.displayDice()
            myDice.isKept = false
            currentstate.cheatVar += 1
        }
    }
    // Check if a dice is chosen as kept before rolling again, will lock the dice to prevent player from rolling the dice.
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
    //If player already roll three times or locked all dice, automatically open the Score Sheet
    func moveToScore() {
        if (currentstate.isEndRoll
            || ((currentstate.Dice1.isLocked)
            && (currentstate.Dice2.isLocked)
            && (currentstate.Dice3.isLocked)
            && (currentstate.Dice4.isLocked)
            && (currentstate.Dice5.isLocked))
        ) {
            isOpenScoreSheet = true
        }
        
    }
    func toggleEndGame() {
        if currentstate.isEndGame {
            isEndGame = true
        }
    }

    
    //DEBUG FUNCTION
    func debugFlags() {
        print("Debug Reset: \(currentstate.isResetToggle)")
        print("Debug Start: \(currentstate.isStart)")
        print("Debug End Roll: \(currentstate.isEndRoll)")
    }
    

    
    //VIEW BODY
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                VStack {
                    Text("Current Turn: \(currentstate.turnNummber)")
                    Text("Remaining Roll(s): \(currentstate.numberOfRoll)")
                }.fullScreenCover(isPresented: $currentstate.isEndGame) {
                    
                }
                Spacer()
                HStack {
                    //Text(String(Dice1.value))
                    //print("Debug check 3: " + String(Dice1.value))
                    Spacer()
                    Button {chooseDice(myDice: currentstate.Dice1)
                        print(currentstate.Dice1.image)
                        print(currentstate.Dice1.isKept)
                    } label: {Image(currentstate.Dice1.image)}
                    Button {chooseDice(myDice: currentstate.Dice2)} label: {Image(currentstate.Dice2.image)}
                    Button {chooseDice(myDice: currentstate.Dice3)} label: {Image(currentstate.Dice3.image)}
                    Button {chooseDice(myDice: currentstate.Dice4)} label: {Image(currentstate.Dice4.image)}
                    Button {chooseDice(myDice: currentstate.Dice5)} label: {Image(currentstate.Dice5.image)}
                    Spacer()
                    //print("Debug check 4: " + String(Dice1.value))
                }.onAppear(){debugFlags()}
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
                    currentstate.numberOfRoll -= 1
                    currentstate.checkEndRoll()
                    let _ = print(currentstate.numberOfRoll)
                    moveToScore()
                    //dump(allDiceValue)
                } label: {
                    Text("Roll Dice 🎲")
                }.buttonStyle(.bordered)
                Button {
                    isOpenScoreSheet.toggle()
                } label: {
                    Text("Open Score Board ✏️")
                    
                }.fullScreenCover(isPresented: $isOpenScoreSheet){
                    ScoreView(currentstate: $currentstate, checkScoreSheet: $isOpenScoreSheet).onAppear(){
                        countDice()
                        debugFlags()
                        if (currentstate.isResetToggle) {
                            currentstate.resetState()
                        }
                    }
                }.buttonStyle(.bordered)
                Spacer()
                Button {
                    isOpenInstruction.toggle()

                } label: {
                    Text("Open Instruction 📘")
                    
                }.sheet(isPresented: $isOpenInstruction){
                    InstructionView()
                }
                

            }
            }
        }


}

struct DiceRollView_Previews: PreviewProvider {
    @State static var debugBool = false
    static var previews: some View {
        DiceRollView(currentstate: GameState(isPlayer2: false))
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
    }
}
