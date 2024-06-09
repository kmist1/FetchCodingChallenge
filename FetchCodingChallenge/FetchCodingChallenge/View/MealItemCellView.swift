//
//  MealItemCellView.swift
//  FetchCodingChallenge
//
//  Created by Krunal Mistry on 6/8/24.
//

import SwiftUI

struct MealItemCellView: View {
    let meal: Meal
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .border(.gray, width: 2)
                    .clipShape(.buttonBorder)
            } placeholder: {
                Image("PlaceHolder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
            }

            Text("\(meal.strMeal)")
                .font(.headline)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .lineLimit(3)
                .frame(height: 70)
        }
        .padding()
    }
}

#Preview {
    MealItemCellView(meal: Meal(strMeal: "Apple Pie",
                                strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", id: "53049"))
}
