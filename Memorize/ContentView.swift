//
//  ContentView.swift
//  Memorize
//
//  Created by Gabriel Carvalho on 12/11/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚗", "🚎", "🚛", "🚜", "🛵", "🏎", "🚲", "🛴", "✈️", "🚅", "🚀", "🛸", "🚁", "🛶", "🚤", "🚒", "🚐", "⛵️", "🛳", "🚈", "🚠", "🚃",]
    @State var emojiCout = 20
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(emojis[0..<emojiCout], id:\.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack {
                remove
                Spacer()
                Text("Shuffle")
                Spacer()
                add
                
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    var add : some View {
        Button {
            if emojiCout < emojis.count {
                emojiCout += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }

    }
    
    var remove : some View {
        Button {
            if emojiCout > 1 {
                emojiCout -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill(.red)
            }
                
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            
    }
}
