//
//  RecipeHeaderView.swift
//  FetchCodingChallenge
//
//  Created by Krunal Mistry on 6/9/24.
//

import SwiftUI

struct RecipeHeaderView: View {
    let imageUrl: String
    let recipeName: String

    var body: some View {
        VStack(alignment: .center) {
            Text(recipeName)
                .font(.title)
                .foregroundColor(.primary)
                .padding()

            Divider()

            AsyncImage(url: URL(string: imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()

            } placeholder: {
                PlaceHolderImageView()
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            .clipped()
            .padding(.top)
        }
        .padding(.top)
    }
}

#Preview {
    RecipeHeaderView(imageUrl: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", recipeName: "Apam balik")
}
