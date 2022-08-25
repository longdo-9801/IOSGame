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
}
