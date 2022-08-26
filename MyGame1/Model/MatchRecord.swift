//
//  MatchRecord.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 26/08/2022.
//

import Foundation

class MatchRecord {
    @Published var timeID : NSDate
    @Published var finalScore : Int
    init(score : Int) {
        self.timeID = NSDate()
        self.finalScore = score
    }
}

class MatchRecord2P {
    @Published var timeID : NSDate
    @Published var finalScoreP2 : Int
    @Published var finalScoreP1 : Int
    init(score1 : Int, score2 : Int) {
        self.timeID = NSDate()
        self.finalScoreP1 = score1
        self.finalScoreP2 = score2
    }
}
