//
//  MealListViewModel.swift
//  FetchCodingChallenge
//
//  Created by Krunal Mistry on 6/8/24.
//

import Foundation

// Responsible to manage meals business logic
class MealListViewModel: ObservableObject {
    private var networkManager: MealsNetworkManagerProtocol

    // MARK: Published Properties
    @Published private(set) var mealList: [Meal] = []
    @Published private(set) var errorMessage: String = ""
    @Published var shouldShowError: Bool = false

    init(networkManager: MealsNetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
    }

    @MainActor
    /// Fetch and update mealList
    func getMeals() async {

        let mealsEndpoint = APIConstant.getCategoryEndpoint()

        do {
            mealList = try await networkManager.fetchMeals(with: mealsEndpoint)
        } catch(let error) {
            let networkError = error as? NetworkError
            errorMessage = networkError?.localizedDescription ?? ""
            shouldShowError = true
        }
    }
}
