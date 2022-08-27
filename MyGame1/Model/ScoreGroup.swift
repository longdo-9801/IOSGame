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
    @Published var finalValue1: Int
    @Published var finalValue2: Int
    @Published var isFilled1 : Bool
    @Published var isFilled2 : Bool
    @Published var isSelectable : Bool
    
    init(name : String, selectState : Bool) {
        self.ID = name
        self.isSelectable = selectState
        self.finalValue1 = 0
        self.finalValue2 = 0
        self.currentValue = 0
        self.isFilled1 = false
        self.isFilled2 = false
        
    }
    
    func resetGroup() {
        self.isSelectable = false
        self.currentValue = 0
    }
    
    func resetGroupFull() {
        self.finalValue1 = 0
        self.finalValue2 = 0
        self.currentValue = 0
        self.isFilled1 = false
        self.isFilled2 = false
    }
}
