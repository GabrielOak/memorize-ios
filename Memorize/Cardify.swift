//
//  Cardify.swift
//  Memorize
//
//  Created by Gabriel Carvalho on 16/11/21.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    
    init(isFaceUp: Bool){
        rotation = isFaceUp ? 0 : 180
    }
    
    var animatableData: Double {
        get {rotation}
        set {rotation = newValue}
    }
    
    var rotation: Double //in degrees
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadious)
            if rotation < 90 {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
            } else {
                shape.fill(.red)
            }
            content
                .opacity(rotation < 90 ? 1 : 0)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
    }
    
    private struct DrawingConstants {
        static let cornerRadious: CGFloat = 10
        static let lineWidth: CGFloat = 3        
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
