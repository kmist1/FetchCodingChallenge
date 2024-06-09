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
            ForEach(ingredients, id: \.self) { ingredient in
                Text(ingredient)
                    .font(.caption2)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
            }
        }
    }
}

#Preview {
    IngredientsView(ingredients: ["Milk", "Oil", "Eggs"])
}
