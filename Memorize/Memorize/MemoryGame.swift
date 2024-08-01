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
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content:String
    }
    
    // optional, if no set, =nil
    private var indexOfFaceUpCard: Int?
    
    private(set) var cards: Array<Card>
    
    
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content as! String))
            cards.append(Card(id: pairIndex*2+1, content: content as! String))
        }
    }
    
    mutating func choose(_ card: Card) {
        let chosenIndex = card.id
        print("choose ",chosenIndex)
        // MARK: why can't find card in cards
        if indexOfFaceUpCard == nil { 
            indexOfFaceUpCard = chosenIndex
        }
        else if cards[chosenIndex].content == cards[indexOfFaceUpCard!].content && chosenIndex != indexOfFaceUpCard {
            cards[chosenIndex].isMatched = true
            cards[indexOfFaceUpCard!].isMatched = true
            print("match")
        }
        for index in cards.indices {
            cards[index].isFaceUp = false
        }
        cards[chosenIndex].isFaceUp.toggle()
        indexOfFaceUpCard = chosenIndex
    }
}
