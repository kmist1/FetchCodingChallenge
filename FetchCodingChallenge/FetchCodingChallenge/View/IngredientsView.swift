//
//  IngredientsView.swift
//  FetchCodingChallenge
//
//  Created by Krunal Mistry on 6/9/24.
//

import SwiftUI

struct IngredientsView: View {
    let ingredients: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Ingredients:")
                .font(.caption)
                .fontWeight(.bold)
                .padding(.bottom, 5)
            if ingredients.isEmpty {
                Text("Ingredients not Available")
                    .font(.caption2)
            } else {
                ForEach(ingredients.indices) { index in
                    Text(ingredients[index])
                        .font(.caption2)
                        .multilineTextAlignment(.leading)
                }
            }
        }
    }
}

#Preview {
    IngredientsView(ingredients: ["Milk", "Oil", "Eggs"])
}
