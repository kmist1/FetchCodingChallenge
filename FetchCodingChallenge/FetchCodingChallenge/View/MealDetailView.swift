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
        .alert(isPresented: $recipeViewModel.shouldShowError, content: {
            Alert(title: Text("Something is Wrong!"), message: Text(recipeViewModel.errorMessage), dismissButton: .cancel({
                recipeViewModel.shouldShowError.toggle()
            }))
        })
    }
}

#Preview {
    MealDetailView(recipeViewModel: RecipeViewModel(), mealId: "53049")
}
