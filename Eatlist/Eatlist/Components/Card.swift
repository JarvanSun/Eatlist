//
//  Card.swift
//  Eatlist
//
//  Created by JarvanSun on 2022/11/23.
//

import SwiftUI

struct Card<Content>: View where Content: View{
    private let content: () -> Content
    
    init(content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity)
            .background(Color(uiColor: .systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .compositingGroup()
            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 1)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card {
            Text("Preview Card Text")
                .multilineTextAlignment(.center)
                .padding()
        }
        .padding()
        .background(Color.primary.gradient)
        .previewLayout(.sizeThatFits)
        .previewColorSchemes()
    }
}
