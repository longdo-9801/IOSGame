//
//  ResultBox.swift
//  MyGame1
//
//  Created by Nguyen Minh Anh on 27/08/2022.
//

import SwiftUI

struct ResultBox: View {
    @State var record: MatchRecord1P
    var body: some View {
        ZStack {
            VStack {
                HStack{
                    Text("Game Date:")
                    Text(record.timeID.formatted())
                }.padding(.top)
                HStack {
                    VStack {
                        Text("PLAYER")
                        Text(record.playerName1)
                    }.padding(.leading)
                    Spacer()
                    VStack{
                        Text("Final Score")
                        Text(record.finalScoreP1.formatted())
                    }.padding()
                }
                
            }
        }
    }
}

struct ResultBox_Previews: PreviewProvider {
    @State static var match : MatchRecord1P = MatchRecord1P(name1: "Boss", score1: 375)
    static var previews: some View {
        ResultBox(record: match)
    }
}
