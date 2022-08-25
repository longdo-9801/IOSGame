//
//  MainMenuView.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 25/08/2022.
//

import Foundation
import SwiftUI

struct MainMenuView: View {
    var body: some View {
        VStack{
            Text("SINGLE PLAYER")
            Text("TWO PLAYER")
            Text("HIGHSCORE")
            Text("MATCH HISTORY")
            Text("How To Play")
        }
    }
    
}


struct MainMenyView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
