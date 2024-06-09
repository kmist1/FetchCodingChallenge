//
//  NetworkManager.swift
//  FetchCodingChallenge
//
//  Created by Krunal Mistry on 6/7/24.
//

import Foundation

/**
 A singleton class responsible for handling network requests and data fetching operations.
 This class utilizes Combine's `async/await` syntax for asynchronous network calls and error handling.
 */
final class NetworkManager {

    //MARK: Properties
    // Singleton Instance
    static let shared = NetworkManager()

    // Private initializer to prevent direct creation
    private init() {}


    //MARK: Private Methods
    /// Generic private method to fetch data for Meals or recipe
    /// - Parameters:
    ///     - url: The URL of the API endpoint to fetch data from.
    /// - Throws: An error representing a network or decoding issue.
    /// - Returns: The decoded data object of the specified type `DataType`.
    private func fetchData<T: Decodable>(from url: String) async throws -> T {

        guard let url = URL(string: url) else { throw NetworkError.invalidURL }

        let request = URLRequest(url: url)
        let response: (Data, URLResponse)

        do {
            response = try await URLSession.shared.data(for: request)
        } catch {
            throw NetworkError.dataRequestFailed(error)
        }

        let httpResponse = response.1 as! HTTPURLResponse
        guard (200...300) ~= httpResponse.statusCode else {
            throw NetworkError.statusCode(httpResponse.statusCode)
        }

        let jsonDecoder = JSONDecoder()

        do {
            let data = try jsonDecoder.decode(T.self, from: response.0)
            return data
        } catch {
            throw NetworkError.decodingError(error)
        }
    }
}

// MARK: Meals Network Service
// Concreate implementation of meals network service
extension NetworkManager: MealsNetworkManagerProtocol {
    //MARK: Public Methods
    /// Fetch Meals data with given URL, extract meals for response data and sort it alphabetacally before returns
    /// - Parameter url: The URL of the API endpoint to fetch data from.
    /// - Returns: returns list of sorted meals
    public func fetchMeals(with url: String) async throws -> [Meal] {
        //fetch Dessert category meals
        let data: MealResponse = try await self.fetchData(from: url)

        var meals = data.meals

        // Sorting meals in alphabetical order
        meals.sort { $0.strMeal < $1.strMeal }

        return meals
    }

    /// Fetch Selected Meal details / recipe
    /// - Parameter url: The URL of the API endpoint to fetch data from.
    /// - Returns: return recipe of selected meal
    public func fetchMealDetails(with url: String) async throws -> [Recipe] {
        // fetch selected Dessert Recipe
        let data: RecipeResponse = try await self.fetchData(from: url)

        let recipes = data.meals

        return recipes
    }
}
