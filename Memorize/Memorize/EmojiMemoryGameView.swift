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
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if card.isMatched == true {
                Rectangle().opacity(0)
            } else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture { game.chooose(card) }
            }
        }
        .padding(.horizontal)
        .foregroundColor(Color(red: 0.65, green: 0.5, blue: 1.0, opacity: 1.0))
    }
}

struct CardView: View {
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 5
        static let fontScale: CGFloat = 0.7
    }
    
    let card: MemoryGame<String>.Card
    
    var body: some View {
        let cardShape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp && !card.isMatched{
                    cardShape.fill().foregroundColor(.white)
                    cardShape.strokeBorder(lineWidth:DrawingConstants.lineWidth)
                    Text(card.content)
                        .multilineTextAlignment(.center)
                        .font(Font.system(size: DrawingConstants.fontScale * min(geometry.size.height,geometry.size.width)))
                    Pie(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 270))
                        .opacity(0.5)
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
}

















struct Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()

        EmojiMemoryGameView(game: game).preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game).preferredColorScheme(.light)
    }
}
