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

    // MARK: Published Properties
    @Published private(set) var showProgressView: Bool = false
    @Published private(set) var recipe: Recipe?
    @Published private(set) var errorMessage: String = ""

    init(networkManager: MealsNetworkManagerProtocol = NetworkManager.shared) {
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
            errorMessage = error.localizedDescription
        }
    }
}
