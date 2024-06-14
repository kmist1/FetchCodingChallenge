//
//  RecipeViewModel.swift
//  FetchCodingChallenge
//
//  Created by Krunal Mistry on 6/8/24.
//

import Foundation

// Responsible to manage Meal's recipes business logic
class RecipeViewModel: ObservableObject {
    private var networkManager: MealsNetworkManagerProtocol

    private(set) var recipe: Recipe?

    // MARK: Published Properties
    @Published private(set) var showProgressView: Bool = false
    @Published private(set) var errorMessage: String = ""
    @Published var shouldShowError: Bool = false

    //MARK: Computed Properties
    var recipeName: String {
        return recipe?.strMeal ?? "Name Not Available"
    }

    var recipeImageUrl: String {
        return recipe?.strMealThumb ?? ""
    }

    var recipeIngredients: [String] {
        return getIngredientsWithMeasures()
    }

    var recipeInstruction: String {
        return recipe?.strInstructions ?? "Instructions Not Available"
    }

    //MARK: Life cycle
    init(receipe: Recipe? = nil, networkManager: MealsNetworkManagerProtocol = NetworkManager.shared) {
        self.recipe = receipe
        self.networkManager = networkManager
    }

    @MainActor
    /// Fetch and update selected meal recipes
    /// - Parameter id: selected meal / dessert id
    func getRecipes(for id: String) async {

        let recipeEndpoint = APIConstant.getDetailsEndpoint()

        showProgressView = true
        do {
            let recipes = try await networkManager.fetchMealDetails(with: recipeEndpoint + id)

            // Assuming that we will have only one recipe available in list, therefore we want to extract out that recipe from list before redering it.
            recipe = recipes.first
            showProgressView = false
        } catch(let error) {
            let networkError = error as! NetworkError
            shouldShowError = true
            errorMessage = networkError.localizedDescription
        }
    }

    //MARK: Private Methods

    /// This method will map ingredients with given measurements and returns result in list of Strings ex. ["ingedient: measure"]
    /// - Returns: return list of mapped ingredient with it's measurement given
    private func getIngredientsWithMeasures() -> [String] {
        guard let ingredients = recipe?.ingredients, let measures = recipe?.measures else { return [] }

        var ingredientsList = [String]()

        for i in 0..<ingredients.count {
            ingredientsList.append("\(ingredients[i]): \(measures[i])")
        }

        return ingredientsList
    }
}
