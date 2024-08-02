//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Rice on 2024/7/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
