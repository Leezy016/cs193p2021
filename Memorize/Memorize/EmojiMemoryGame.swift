//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Rice on 2024/8/1.
//
//  ViewModel

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    private static let words = ["🐼","☎️","🍙","✈️","🫂","⏰","🎮","🍔","🏖️"]
    
    @Published private var model = MemoryGame(numberOfPairsOfCards: words.count){ pairIndex in words[pairIndex]}
    
    var cards: Array<MemoryGame<String>.Card> { model.cards }
    
    //MARK: - Intents
    
    func chooose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
