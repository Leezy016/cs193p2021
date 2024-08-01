//
//  MemoryGame.swift
//  Memorize
//
//  Created by Rice on 2024/8/1.
//
//  View Model
import Foundation



struct MemoryGame<CardContent> {
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var index: Int
        var content:String
    }
    
    private(set) var cards: Array<Card>
    
    
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(index: pairIndex*2, content: content as! String))
            cards.append(Card(index: pairIndex*2+1, content: content as! String))
        }
    }
    
    

    func choose(card: Card) {
        
    }
}
