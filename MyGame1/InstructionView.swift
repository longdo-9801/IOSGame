//
//  InstructionView.swift
//  MyGame1
//
//  Created by Long, Do Ha Minh on 26/08/2022.
//

import SwiftUI



struct InstructionView: View {
    @State var collapseSection1 : Bool = false
    @State var collapseSection2 : Bool = false
    @State var collapseSection3 : Bool = false
    @State var collapseSection4 : Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                Image("Logo").background(Color.white)
                Text(
                    "Yahtzee is dice game invented by entrepreneur Edwin S. Lowe based on the popular Yacth dice game of the same format. As it most basic, player(s) require only five dices, pen and paper to play."
                ).padding(.vertical)
                PictureNote(image: "YathzeeGame", annotation: "An example of a physical Yathzee set")
                Text("How To Play").font(.title).padding()
                VStack{
                    Text("The game consist of two main screens, the **Dice roll screen** and the **Score sheet screen**")
                    PictureNote(image: "LowerGroup", annotation: "The two main game screen")
                    Text("Each turn, the player roll the dices in the dice roll screen and use the results of their roll to fill the sheets. The game ends once they filled out all the categories in the score sheet.")
                    Text("Note for Yahtzee veteran: The game currently does not employ Joker rules.").padding(2).foregroundColor(.purple)
                    Button{
                        collapseSection1.toggle()
                    } label: {
                        Text("Dice Rolling").font(.title2).padding()
                    }.buttonStyle(.borderless).border(.black,width: 2)
                    if collapseSection1 {
                        VStack{
                            
                            Text("The player have three chances to roll their dices. The player can choose to keep a dice by tapping it which will lock the dice after they roll. If all five dices are locked or the player rolled three times they will automatically be taken to score sheet.")
                            PictureNote(image: "Dice1", annotation: "The dice")
                            PictureNote(image: "Dice1-Off", annotation: "The dice after being lock")
                        }
                    }
                    Button{
                        collapseSection2.toggle()
                    } label: {
                        Text("Sheet Filling").font(.title2).padding()
                    }.buttonStyle(.borderless).border(.black,width: 2)
                    if collapseSection2 {
                        VStack{
                            
                            Text("The sheets consist of thirteen score categories which much be all filled to finish the game. The number beside the <Commit> button correspond with the score that can be filled in.")
                            VStack(alignment: .leading){
                                PictureNote(image: "ScoreExample", annotation: "An example of a score sheet in session")
                                Text("+ Black are numbers that are already filled.")
                                Text("+ Grey are numbers that can be fill.")
                                Text("+ Empty spots indicate that the corresponding categories can't be filled with that dice roll.")
                            }
                            Text("Pressing the <Commit> button will permanently fill the corresponding category.")
                            Text("The score categories can be divided into two groups: Upper and Lower.")
                            Button{
                                collapseSection3.toggle()
                            } label: {
                                Text("Upper Score Group").font(.title3).padding()
                            }.buttonStyle(.borderless).border(.black,width: 2)
                            if collapseSection3 {
                                VStack{
                                    Text("Upper groups consist of six simple scoring categories: Aces, Twos, Threes, Fours, Fives, Sixes")
                                    Text("To fill these categories the Player only need to have at least one dice of the corresponding value")
                                    Text("i.e [1] -> Ace, [2] -> Two and so on.")
                                    Text("The amount of points earn in each category corespond to the number of dice of that values.")
                                     Text("If the total score of the upper group is 63 the Player will earn a bonus +35 points")
                                }
                            }
                            Button{
                                collapseSection4.toggle()
                            } label: {
                                Text("Lower Score Group").font(.title3).padding()
                            }.buttonStyle(.borderless).border(.black,width: 2)
                            if collapseSection4 {
                                VStack{
                                    Text("The Lower groups consist of seven categories each with own rules")
                                    PictureNote(image: "LowerGroup", annotation: "An example of a Lower Groups scoring.")
                                    Text("Source: [Wikipedia](https://en.wikipedia.org/wiki/Yahtzee#Rules)").foregroundColor(.gray)
                                    VStack{
                                        Group{
                                            Text("+ Three of a kind")
                                            Text("If player's roll have three or more matching dices, they can fill this slot with the sum of all five dice.").multilineTextAlignment(.leading)
                                        }.padding(.all,1)
                                        Group{
                                            Text("+ Four of a kind")
                                            Text("If player's roll have four or more matching dices, they can fill this slot with the sum of all five dice.").multilineTextAlignment(.leading)
                                        }.padding(.all,1)
                                        Group{
                                            Text("+ Full House")
                                            Text("If player's roll have three matching dices of one value and two matching of another (for example three [2] and two [6]) they can fill this slot a set score of 25").multilineTextAlignment(.leading)
                                        }.padding(.all,1)
                                        Group{
                                            Text("+ Small Straight")
                                            Text("If player roll's have four dices with sequential value (1-2-3-4, 2-3-4-5 or 3-4-5-6) they can fill this slot a set score of 30").multilineTextAlignment(.leading)
                                        }.padding(.all,1)
                                        Group{
                                            Text("+ Large Straight")
                                            Text("If player roll's have five dices with sequential value (1-2-3-4-5, or 2-3-4-5-6) they can fill this slot a set score of 40").multilineTextAlignment(.leading)
                                        }.padding(.all,1)
                                        Group{
                                            Text("+ Yahtzee")
                                            Text("If player's roll have five matching dices, they can fill this slot a set score of 50").multilineTextAlignment(.leading)
                                        }.padding(.all,1)
                                        Group{
                                            Text("+ Chance")
                                            Text("A free slot. Player can fill this slot with the sum of all five dices  ").multilineTextAlignment(.leading)
                                        }.padding(.all,1)
                                    }
                            }
                            
                            
                            }
                            
                        }
                    }
                }
                Text("Full Rules").font(.title)
                Text("Source: [Wikipedia](https://en.wikipedia.org/wiki/Yahtzee#Rules)")
                
            }
        }
        
    }
 
}

struct Instruction_Previews: PreviewProvider {
    @State static var debugBool = true
    static var previews: some View {
        InstructionView()
    }
}
