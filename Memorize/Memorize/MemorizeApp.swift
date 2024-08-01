//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Rice on 2024/7/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
