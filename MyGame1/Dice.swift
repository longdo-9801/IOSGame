//
//  Dice.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 18/08/2022.
//

import Foundation
import CoreImage

class Dice {
    init(id: Int, value:Int, image:String, isKept: Bool) {
        self.ID = id
        self.value = value
        self.image = image
        self.isKept = isKept
    }
    var ID : Int
    var value : Int
    var image : String
    var isKept : Bool
}
