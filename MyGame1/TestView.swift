//
//  TestView.swift
//  MyGame1
//
//  Created by Nguyen Minh Anh on 28/08/2022.
//

import SwiftUI

struct TestView: View {
        @State private var half = false
        @State private var dim = false
    @State var location : Float = 2.0
        
        var body: some View {
            Image("Dice1")
                .offset(y: CGFloat(location))
                .opacity(dim ? 0.2 : 1.0)
                .animation(.easeInOut(duration: 1.0))
                .onTapGesture {
                    self.dim.toggle()
                    self.half.toggle()
                    if half {
                        location = 100.0
                    } else {
                        location = -100.0
                    }
                    
                }
        }
}


struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
