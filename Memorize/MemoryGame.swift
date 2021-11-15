//
//  MemoryGame.swift
//  Memorize
//
//  Created by Gabriel Carvalho on 13/11/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfChosedCard: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp}).oneAndOnly}
        set { cards.indices.forEach{ cards[$0].isFaceUp = ($0 == newValue)}}
    }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let machIndex = indexOfChosedCard {
                if cards[chosenIndex].content == cards[machIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[machIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfChosedCard = chosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}

extension Array {
    var oneAndOnly: Element? {
        if self.count == 1 {
            return self.first
        } else {
            return nil
        }
    }
}
