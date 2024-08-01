//
//  ContentView.swift
//  Memorize
//
//  Created by Rice on 2024/7/22.
//

import SwiftUI

var words = ["🐼","☎️","🍙","✈️","🫂","⏰","🎮",
             "Stupid Bing\nCome and play with me","Hurry up","Ring Ring Ring Ring","What are you doing now","Do you miss me","Why can't we stay together","I really want you around","please","If you are going to eat hotpot for dinner, I'd like to have shrimp balls","Hey let's play Nintendo Switch","I bought this new game, it needs two players","Why aren't you here","I need you here","We can build a house together","Explore the world in our house","Will we have a pony","And cats and dogs and goldfishes","Or even kids if that's what you really want", "to reproduse like a decent human being","What about we go to seaside again","I will kiss you in the water","and we go beyond the shark net just to see if there is really sharks in the sea","So many things to do","if only you are here","I'm tied of fantasizing","I might quit this love game now","It hurts","Like I told you","It starts from the stomach, grows up to my chest","The pain peaks at throat, like swallowing asid","You know I don't like vinegar","how can I stand this","But it comes every night","When there is no one to talk to","Shall we dance","I","Love","You"]

var wordsCnt = 28

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100, maximum: 200))]){
                    ForEach(words, id:\.self, content: { word in CardView(content: word)})
                }
            }
            .padding(30)
            .foregroundColor(Color(red: 0.65, green: 0.5, blue: 1.0, opacity: 1.0))
        }
    }
}

struct CardView: View {
    
    @State var isFaceUp:Bool=false
    var content:String="Ring Ring Ring Ring"
    let cardShape = RoundedRectangle(cornerRadius: 10)
    
    var body: some View {
        ZStack {
            if isFaceUp {
                cardShape.fill().foregroundColor(.white)
                cardShape.strokeBorder(lineWidth:5)
                Text(content)
                    .multilineTextAlignment(.center)
                    .padding(10)
            }
            else {
                cardShape
                Text("🐼☎️🍙")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color(white: 1))
                    .padding(10)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

















struct Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
        ContentView().preferredColorScheme(.light)
    }
}
