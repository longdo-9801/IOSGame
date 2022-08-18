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

    @State var Dice1 = Dice(id: 1, value: 6, image: "Dice5", isKept: false)
    @State var Dice2 = Dice(id: 2, value: 1, image: "Dice1", isKept: false)
    @State var Dice3 = Dice(id: 3, value: 1, image: "Dice1", isKept: false)
    @State var Dice4 = Dice(id: 4, value: 1, image: "Dice1", isKept: false)
    @State var Dice5 = Dice(id: 5, value: 1, image: "Dice1", isKept: false)

    func rolldice(){
//        if (Dice1.isKept) {
//            Dice1.value = Int.random(in: 1...6)
//        }
//        if (!Dice2.isKept) {
//            Dice2.value = Int.random(in: 1...6)
//        }
//        if (!Dice3.isKept) {
//            Dice3.value = Int.random(in: 1...6)
//        }
//        if (!Dice4.isKept) {
//            Dice4.value = Int.random(in: 1...6)
//        }
//        if (!Dice5.isKept) {
//            Dice5.value = Int.random(in: 1...6)
//        }
        Dice1.value = Int.random(in: 1...6)
        print("DEBUG CHECK")
    }
    
    func displayDice(myDice : Dice) {
        print("DEBUG CHECK IMAGE")
        switch  myDice.value {
        case 1:
            myDice.image = "Dice1"
        case 2:
            myDice.image = "Dice2"
        case 3:
            myDice.image = "Dice3"
        case 4:
            myDice.image = "Dic4"
        case 5:
            myDice.image = "Dice5"
        case 6:
            myDice.image = "Dice6"
            
        default:
           print("Dice Value Error")
        }
    }

    var body: some View {


        ZStack {
            VStack {
                HStack {
                    Text(String(Dice1.value))
                    Image(Dice1.image)
                }
                
                Button {
                    print("DEBUG Button")
                    rolldice()
                    displayDice(myDice: Dice1)
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
