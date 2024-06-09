//
//  MealDetailView.swift
//  FetchCodingChallenge
//
//  Created by Krunal Mistry on 6/9/24.
//

import SwiftUI

struct MealDetailView: View {
    @ObservedObject var recipeViewModel: RecipeViewModel
    let mealId: String

    init(recipeViewModel: RecipeViewModel, mealId: String) {
        self.recipeViewModel = recipeViewModel
        self.mealId = mealId
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                RecipeHeaderView(imageUrl: recipeViewModel.recipeImageUrl,
                                 recipeName: recipeViewModel.recipeName)
                Divider()

                IngredientsView(ingredients: recipeViewModel.recipeIngredients)
                    .padding()

                Divider()

                InstructionView(instruction: recipeViewModel.recipeInstruction)
                    .padding()
            }
        }
        .onAppear(perform: {
            Task {
                await recipeViewModel.getRecipes(for: mealId)
            }
        })

    }
}

#Preview {
    MealDetailView(recipeViewModel: RecipeViewModel(), mealId: "53049")
}
