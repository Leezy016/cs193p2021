//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Rice on 2024/7/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                ForEach(game.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.chooose(card)
                        }
                }
            }
            .padding(30)
            .foregroundColor(Color(red: 0.65, green: 0.5, blue: 1.0, opacity: 1.0))
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    let cardShape = RoundedRectangle(cornerRadius: 10)
    
    var body: some View {
        ZStack {
            if card.isFaceUp && !card.isMatched{
                cardShape.fill().foregroundColor(.white)
                cardShape.strokeBorder(lineWidth:5)
                Text(card.content)
                    .multilineTextAlignment(.center)
                    .padding(10)
            }
            else if card.isMatched {
                cardShape.opacity(0)
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
    }
}

















struct Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        EmojiMemoryGameView(game: game).preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game).preferredColorScheme(.light)
    }
}
