//
//  FoodCard.swift
//  Eatlist
//
//  Created by JarvanSun on 2022/11/23.
//

import SwiftUI

struct FoodCard: View {
    var body: some View {
        Card {
            ZStack(alignment: .bottom) {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFill()
                
                Text("Dish")
                    .font(.headline)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .background(.regularMaterial)
            }
        }
    }
}

struct FoodCard_Previews: PreviewProvider {
    static var previews: some View {
        FoodCard()
            .frame(width: 120, height: 100)
            .padding()
            .previewLayout(.sizeThatFits)
            .previewColorSchemes()
    }
}
