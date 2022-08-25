//
//  ScoreGroup.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 18/08/2022.
//

import Foundation

class ScoreGroup : ObservableObject {
    @Published var ID : String
    @Published var currentValue : Int
    @Published var finalValue: Int
    @Published var isFilled : Bool
    @Published var isSelectable : Bool
    
    init(name : String, selectState : Bool) {
        self.ID = name
        self.isSelectable = selectState
        self.displayValue = 0
        self.finalValue = 0
        self.displayValue = 0
        self.isFilled = false
        
    }
}
