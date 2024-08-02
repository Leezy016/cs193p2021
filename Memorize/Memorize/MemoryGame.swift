//
//  MemoryGame.swift
//  Memorize
//
//  Created by Rice on 2024/8/1.
//
//  Model

import Foundation

// where cardContent: Equatable
struct MemoryGame<CardContent> {
    
    struct Card: Identifiable {
        // never change after create
        let id: Int
        let content:String
        
        // can be changed
        var isFaceUp = false
        var isMatched = false
        
    }
    private(set) var cards: Array<Card>

    private var indexOfFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content as! String))
            cards.append(Card(id: pairIndex*2+1, content: content as! String))
        }
    }
    
    mutating func choose(_ card: Card) {
        let chosenIndex = card.id
        cards[chosenIndex].isFaceUp.toggle()
        print("choose ",cards[chosenIndex])
      
        // safe optional
        if let potentialMatchIndex = indexOfFaceUpCard {
            if cards[chosenIndex].content == cards[potentialMatchIndex].content && chosenIndex != potentialMatchIndex {
                cards[chosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
                print("\nmatch\n")
            }
        }
        for index in cards.indices {
            cards[index].isFaceUp = false
        }
        cards[chosenIndex].isFaceUp = true
        indexOfFaceUpCard = chosenIndex
        print("indexOfFaceUpCard", indexOfFaceUpCard ?? -1)

    }
}
