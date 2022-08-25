//
//  ScoreBox.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 25/08/2022.
//

import SwiftUI

struct ScoreBoxView : View {
    @State var displayPoint = ""
    @ObservedObject var scoreBoard : ScoreGroup
    @Binding var isOpenScoreSheet : Bool
    var checkP2 : Bool
    @ State var textColor : Color = .gray

    func selectScoreGroup(scoreGroup : ScoreGroup) {
        if (checkP2) {
            scoreGroup.finalValue2 = scoreGroup.currentValue
            displayPoint = String(scoreGroup.finalValue2)
            scoreGroup.isSelectable = false
            scoreGroup.isFilled2 = true
        } else {
            scoreGroup.finalValue1 = scoreGroup.currentValue
            displayPoint = String(scoreGroup.finalValue1)
            scoreGroup.isSelectable = false
            scoreGroup.isFilled1 = true
        }
    }
    
    
    var body: some View {
        HStack (spacing : 0) {
                //Spacer()
            Text(scoreBoard.ID).frame(alignment: .leading)
            Spacer(minLength: 100)
            Text(displayPoint).foregroundColor(textColor).frame(alignment: .trailing)
            Spacer().frame(width: 30)
            Button {
                selectScoreGroup(scoreGroup: scoreBoard)
                self.displayPoint = String(scoreBoard.finalValue1)
                self.textColor = .black
            } label: {
                Text("Commit")
            }.frame(alignment: .trailing).buttonStyle(.bordered)
            //Spacer()
        }.onAppear {
            if (!scoreBoard.isFilled1){
                self.displayPoint = String(scoreBoard.currentValue)
            } else {
                func setText2(){
                    self.displayPoint = String(scoreBoard.finalValue1)
                    self.textColor = .black
                }
            }
            
        }
        
        
            
    }
}

struct ListElementViewPreview: PreviewProvider {
    @State static var debugBool = true
    static var previews: some View {
        ZStack {
            Color.white
            ScoreBoxView(displayPoint: "50",
                         scoreBoard: ScoreGroup(name: "Four of a Kind", selectState : false),
                         isOpenScoreSheet: $debugBool, checkP2: false, textColor: .gray)
        }
        
    }
}
