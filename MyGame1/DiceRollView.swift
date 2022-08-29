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
    @Binding var isRestart : Bool
    @Binding var recordList : Array<MatchRecord1P>
//    @State var dice1Location : Float = 0
//    @State var dice2Location : Float = 0
//    @State var dice3Location : Float = 0
//    @State var dice4Location : Float = 0
//    @State var dice5Location : Float = 0
//    @State var dice1Rotation : Float = 0
//    @State var dice2Rotation : Float = 0
//    @State var dice3Rotation : Float = 0
//    @State var dice4Rotation : Float = 0
//    @State var dice5Rotation : Float = 0


    
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
        
        if (myDice.isLocked) {}
        else if (!myDice.isKept && myDice.value != 0) {
            myDice.isKept = true
            myDice.displayDice()
            currentstate.cheatVar += 1 //A variable to force view to update
            EffectManager.playSounds(soundfile: "Lock.mp3")
        } else if (myDice.isKept){
            myDice.isKept = false
            myDice.displayDice()
            currentstate.cheatVar += 1
            EffectManager.playSounds(soundfile: "Lock.mp3")
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
//    func animateDice(myDice : Dice, diceLocation : inout Float, diceRotation : inout Float){
//        if myDice.isLocked {
//            diceLocation = Float(-200)
//            diceRotation = Float(0)
//        } else if myDice.value != 0 {
//            diceLocation = Float(0)
//            diceRotation = Float(45)
//        } else if myDice.value == 0 {
//            diceLocation = Float(0)
//            diceRotation = Float(0)
//        }
//    }
    func toggleEndGame() {
        if currentstate.isEndGame {
            isEndGame = true
        }
    }

    func setEndGame() {
        
    }
    
    //DEBUG FUNCTION
    func debugFlags() {
        print("Debug Reset: \(currentstate.isResetToggle)")
        print("Debug Start: \(currentstate.isStart)")
        print("Debug End Roll: \(currentstate.isEndRoll)")
        print("Debug End Game: \(currentstate.isEndGame)")
    }
    

    
    //VIEW BODY
    var body: some View {
        if isEndGame {
            HSView(recordList: $recordList, gameState: currentstate, isRestart: $isRestart).onAppear(){
                EffectManager.playSounds(soundfile: "yay.mp3")
                print("DEBUG YAY")
            }.onDisappear(){
                //currentstate.fullReset()
                isEndGame = false
                print("DEBUG reset")
            }
        } else {
            ZStack {
                VStack {
                    VStack{
                        //Top Text show the turn number, last turn is 13
                        Text("Current Turn: \(currentstate.turnNumber)")
                        //Text for 2Player Mode, show which player is playing
                        if (currentstate.is2PlayerMode) {
                            currentstate.isP2 ? Text("Player 2 Turn"):Text("Player 1 Turn")
                        }
                    }
                    VStack {
                        //Show the remaining row in the current turn
                        Text("Remaining Roll(s): \(currentstate.numberOfRoll)")
                        if (currentstate.isEndRoll
                                    || ((currentstate.Dice1.isLocked)
                                        && (currentstate.Dice2.isLocked)
                                        && (currentstate.Dice3.isLocked)
                                        && (currentstate.Dice4.isLocked)
                                        && (currentstate.Dice5.isLocked)
                                       )
                            ) {
                            Text("Please proceed to the score sheet")
    
                        }
                    }
                    Spacer()
                    HStack {//Dice area
                        Spacer()
                        Button {chooseDice(myDice: currentstate.Dice1)} label: {Image(currentstate.Dice1.image)}
                        Button {chooseDice(myDice: currentstate.Dice2)} label: {Image(currentstate.Dice2.image)}
                        Button {chooseDice(myDice: currentstate.Dice3)} label: {Image(currentstate.Dice3.image)}
                        Button {chooseDice(myDice: currentstate.Dice4)} label: {Image(currentstate.Dice4.image)}
                        Button {chooseDice(myDice: currentstate.Dice5)} label: {Image(currentstate.Dice5.image)}
                        
                        Spacer()
                    }.onAppear(){
                        //Gameplay BGM
                        MusicManager.playSounds(soundfile: "gameBGM.mp3")
                    }
                    Button {
                        //Play dice sound when player click roll
                        EffectManager.playSounds(soundfile: "dice.mp3")
                        if currentstate.numberOfRoll > 0 {
                            //Disable dice rolling functionality if no more roll are available
                            currentstate.allDiceValue.removeAll()
                            lockDice()
                            rolldice()
                            currentstate.allDiceValue.append(contentsOf: [currentstate.Dice1.value,
                                                                          currentstate.Dice2.value,
                                                                          currentstate.Dice3.value,
                                                                          currentstate.Dice4.value,
                                                                          currentstate.Dice5.value])
                            if currentstate.numberOfRoll > 0 {
                                currentstate.numberOfRoll -= 1
                        }

                        }
                        //Dice value counter and scoring validator
                        //Place here to ensure ScoreSheetView can render and update all data on appear each time
                        currentstate.checkEndRoll()
                        currentstate.countDice()
                        currentstate.sumDiceValue(scoreboard: currentstate.ScoreChance)
                        currentstate.upperGroupCheck()
                        currentstate.checkDiceCombo()
                        currentstate.checkDiceSequence()
                        currentstate.checkNoMove()
                        currentstate.Dice1.displayDice()
                        currentstate.Dice2.displayDice()
                        currentstate.Dice3.displayDice()
                        currentstate.Dice4.displayDice()
                        currentstate.Dice5.displayDice()
                        //DEBUG Dice Value Count
                        print("Score 1 check: \(currentstate.ScoreAce.isSelectable)")
                        print("Score 2 check: \(currentstate.ScoreTwo.isSelectable)")
                        print("Score 3 check: \(currentstate.ScoreThree.isSelectable)")
                        print("Score 4 check: \(currentstate.ScoreFour.isSelectable)")
                        print("Score 5 check: \(currentstate.ScoreFive.isSelectable)")
                        print("Score 6 check: \(currentstate.ScoreSix.isSelectable)")
                        print("Score 3k check: \(currentstate.ScoreThreeKind.isSelectable)")
                        print("Score 4k check: \(currentstate.ScoreFourKind.isSelectable)")
                        print("Score FH check: \(currentstate.ScoreFullHouse.isSelectable)")
                        print("Score SS check: \(currentstate.ScoreSmallStraight.isSelectable)")
                        print("Score LS check: \(currentstate.ScoreLargeStraight.isSelectable)")
                        print("Score Y check: \(currentstate.ScoreYahtzee.isSelectable)")
                        print("Score C check: \(currentstate.ScoreChance.isSelectable)")
                        dump(currentstate.diceValueCount)
                    } label: {
                        Text("Roll Dice 🎲")
                    }.buttonStyle(.bordered)
                    Button {
                        isOpenScoreSheet.toggle()
                        EffectManager.playSounds(soundfile: "paper.mp3")
                    } label: {
                        Text("Open Score Board ✏️")
                        
                    }.fullScreenCover(isPresented: $isOpenScoreSheet){
                        ScoreSheetView(currentstate: currentstate, checkScoreSheet: $isOpenScoreSheet).onAppear(){
                            currentstate.countDice()
                            debugFlags()
                        }.onDisappear(){
                            currentstate.checkEndGame()
                            print("END GAME?")
                            debugFlags()
                            isEndGame = currentstate.isEndGame
                        }
                    }.buttonStyle(.bordered)
                    Spacer()
                    //DEBUG Button to launch the high score view without needing to play through the full game, uncomment to enable
//                    Button {
//                        isEndGame.toggle()
//
//                    } label: {
//                        Text("DEBUG ENDGAME")
//
//                    }
                    //Open instruction view as a collapsable sheet
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


}

struct DiceRollView_Previews: PreviewProvider {
    @State var debugBool = false
    @State static var debugBool2 = false
    @State static var previewList : [MatchRecord1P] = [MatchRecord1P(name1: "Boss", score1: 375)]
    static var previews: some View {
        Group
        {
            //Preview for 1 player mode
            DiceRollView(currentstate: GameState(isPlayer2: false,Player1: "Default",Player2: ""), isRestart: $debugBool2, recordList: $previewList)
            /* Preview for 2 player mode,  playable */
            //DiceRollView(currentstate: GameState(isPlayer2: true,Player1: "Default",Player2: "Default2"), recordList: $previewList)
        }
    }
}
