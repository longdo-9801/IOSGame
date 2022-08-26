//
//  Dice.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 18/08/2022.
//

import Foundation
import CoreImage

class Dice : ObservableObject {
    init(id: Int, value:Int, image:String) {
        self.ID = id
        self.value = value
        self.image = image
        self.isKept = false
        self.isLocked = false
    }
    @Published var ID : Int
    @Published var value : Int
    @Published var image : String
    @Published var isKept : Bool
    @Published var isLocked: Bool
    
    //Function to change dice visual to free variant
    func displayDice() {
        //print("DEBUG CHECK IMAGE 1: " + myDice.image)
        switch  self.value {
        case 1:
            self.image = "Dice1"
        case 2:
            self.image = "Dice2"
        case 3:
            self.image = "Dice3"
        case 4:
            self.image = "Dice4"
        case 5:
            self.image = "Dice5"
        case 6:
            self.image = "Dice6"
            
        default:
            self.image = "DiceDefault"
            print("Dice Value Error")
        }
        //print("DEBUG CHECK IMAGE 2: " + myDice.image)
    }
    //Function to change dice visual to lock variant
    func displayDiceOff() {
        //print("DEBUG CHECK IMAGE 1: " + myDice.image)
        switch  self.value {
        case 1:
            self.image = "Dice1-Off"
        case 2:
            self.image = "Dice2-Off"
        case 3:
            self.image = "Dice3-Off"
        case 4:
            self.image = "Dice4-Off"
        case 5:
            self.image = "Dice5-Off"
        case 6:
            self.image = "Dice6-Off"
            
        default:
            self.image = "DiceDefault"
            print("Dice Value Error")
        }
        //print("DEBUG CHECK IMAGE 2: " + myDice.image)
    }
    
    func resetDice() {
        self.value = 0
        self.isKept = false
        self.isLocked = false
        self.image = "DiceDefault"
    }
}
