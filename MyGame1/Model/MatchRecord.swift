//
//  MatchRecord.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 26/08/2022.
//

import Foundation

class MatchRecordSaveVer : NSObject, NSCoding {
    @Published var timeID : Date
    @Published var playerName: String
    @Published var finalScore : Int
    init(name : String,score : Int, time : Date) {
        playerName = name
        self.timeID = time
        self.finalScore = score
    }
    
    init(name : String,score : Int) {
        playerName = name
        self.timeID = Date()
        self.finalScore = score
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let timeID = aDecoder.decodeObject(forKey: "time") as! Date
        let playerName = aDecoder.decodeObject(forKey: "name") as! String
        let finalScore = aDecoder.decodeObject(forKey: "score") as! Int
        self.init(name: playerName, score: finalScore)
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(timeID, forKey: "time")
        aCoder.encode(playerName, forKey: "name")
        aCoder.encode(finalScore, forKey: "score")
    }
}

class MatchRecord1P : Identifiable {
    @Published var timeID : Date
    @Published var playerName1: String
    @Published var finalScoreP1 : Int
    init(name1: String, score1 : Int) {
        self.timeID = Date()
        self.playerName1 = name1
        self.finalScoreP1 = score1
    }
    //For manual creation of record
    init(name1: String, score1 : Int, time: Date) {
        self.timeID = time
        self.playerName1 = name1
        self.finalScoreP1 = score1
    }
}
class MatchRecord2P {
    @Published var timeID : Date
    @Published var playerName1: String
    @Published var playerName2: String
    @Published var finalScoreP2 : Int
    @Published var finalScoreP1 : Int
    init(name1: String,name2: String, score1 : Int, score2 : Int) {
        self.timeID = Date()
        playerName1 = name1
        playerName2 = name2
        self.finalScoreP1 = score1
        self.finalScoreP2 = score2
    }
}
