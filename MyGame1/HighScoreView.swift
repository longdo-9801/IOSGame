//
//  HighScoreView.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 25/08/2022.
//

import SwiftUI

struct HSView : View {
    @State var recordList : Array<MatchRecord1P>
    
    init(list : Array<MatchRecord1P>) {
        recordList = list
    }
    var body: some View {
        ZStack {
            VStack{
                Text("Play Record")
                List {
                    ForEach(recordList) { record in
                        ResultBox(record: record)
                    }
                }
        
            }
        }
    }
}

struct HSView_Previews: PreviewProvider {
    @State static var oeviewList : [MatchRecord1P] = [MatchRecord1P(name1: "Boss", score1: 375),MatchRecord1P(name1: "Boss", score1: 375),MatchRecord1P(name1: "Boss", score1: 375),MatchRecord1P(name1: "Boss", score1: 375)]
    static var previews: some View {
        HSView(list: oeviewList)
    }
}
