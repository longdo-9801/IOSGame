//
//  PictureNote.swift
//  MyGame1
//
//  Created by Nguyen Minh Anh on 27/08/2022.
//

import SwiftUI

//View meant to display a picture along side an annotation.
struct PictureNote: View {
    @State var image : String
    //@State var imagePlaceholder : String
    @State var annotation : String
    var body: some View {
        VStack{
            Image(image)
            //Text(imagePlaceholder).foregroundColor(.red)
            Text(annotation).foregroundColor(.gray).baselineOffset(2)
        }.padding(.all,5)
    }
}

struct PictureNote_Previews: PreviewProvider {
    static var previews: some View {
        //PictureNote(imagePlaceholder: "Placeholder Image", annotation: "My Placeholder")
        PictureNote(image: "Dice1", annotation: "My Placeholder")
    }
}
