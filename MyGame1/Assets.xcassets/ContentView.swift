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

    @StateObject var Dice1 = Dice(id: 1, value: 6, image: "Dice5")
    @StateObject var Dice2 = Dice(id: 2, value: 1, image: "Dice1")
    @StateObject var Dice3 = Dice(id: 3, value: 1, image: "Dice1")
    @StateObject var Dice4 = Dice(id: 4, value: 1, image: "Dice1")
    @StateObject var Dice5 = Dice(id: 5, value: 1, image: "Dice1")

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
            displayDice(myDice: Dice1)
            myDice.isKept = false
        } else {
            displayDiceOff(myDice: Dice1)
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
                    lockDice()
                    rolldice()
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
