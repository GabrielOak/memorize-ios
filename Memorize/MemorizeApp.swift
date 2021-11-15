//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Gabriel Carvalho on 12/11/21.
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
