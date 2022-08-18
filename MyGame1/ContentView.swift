//
//  ContentView.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 18/08/2022.
//

import SwiftUI


struct ContentView: View {

    @State var diceValue1 = 1
    @State var diceValue2 = 1
    @State var diceValue3 = 1
    @State var diceValue4 = 1
    @State var diceValue5 = 1
    @State var diceValue6 = 1
    @State var keepDice1 = false
    @State var keepDice2 = false
    @State var keepDice3 = false
    @State var keepDice4 = false
    @State var keepDice5 = false
    @State var keepDice6 = false

    func rolldice(){
        diceValue1 = Int.random(in: 1...6)
    }

    var body: some View {


        ZStack {
            VStack {
                HStack {
                    Text(String(diceValue1))
                        .padding()
                    Text(String(diceValue2))
                        .padding()
                    Text(String(diceValue3))
                        .padding()
                    Text(String(diceValue4))
                        .padding()
                    Text(String(diceValue5))
                        .padding()
                    Text(String(diceValue6))
                        .padding()
                }
                
                Button {
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
//Example Code
//var n = 3
//
//struct ContentView: View {
//    @State private var arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
//    var body: some View {
//        Text(String(arr[n])).onTapGesture {
//            self.arr[n] = 100
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
