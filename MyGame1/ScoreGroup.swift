//
//  ScoreGroup.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 18/08/2022.
//

import Foundation

class ScoreGroup : ObservableObject {
    @Published var ID : String
    @Published var value : Int
    @Published var isFilled : Bool
    
    init(name : String) {
        self.ID = name
        self.value = 0
        self.isFilled = false
    }
}
