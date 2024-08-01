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
    
    static let words = ["🐼","☎️","🍙","✈️","🫂","⏰","🎮","Stupid Bing\nCome and play with me","Hurry up","Ring Ring Ring Ring","What are you doing now","Do you miss me","Why can't we stay together","I really want you around","please","If you are going to eat hotpot for dinner, I'd like to have shrimp balls","Hey let's play Nintendo Switch","I bought this new game, it needs two players","Why aren't you here","I need you here","We can build a house together","Explore the world in our house","Will we have a pony","And cats and dogs and goldfishes","Or even kids if that's what you really want", "to reproduse like a decent human being","What about we go to seaside again","I will kiss you in the water","and we go beyond the shark net just to see if there is really sharks in the sea","So many things to do","if only you are here","I'm tied of fantasizing","I might quit this love game now","It hurts","Like I told you","It starts from the stomach, grows up to my chest","The pain peaks at throat, like swallowing asid","You know I don't like vinegar","how can I stand this","But it comes every night","When there is no one to talk to","Shall we dance"]
    
    @Published private var model: MemoryGame<String> = MemoryGame(numberOfPairsOfCards: words.count){ pairIndex in words[pairIndex]}
    
    var cards: Array<MemoryGame<String>.Card> { model.cards }
    
    //MARK: - Intents
    
    func chooose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
