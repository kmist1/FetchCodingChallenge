//
//  Meal.swift
//  FetchCodingChallenge
//
//  Created by Krunal Mistry on 6/6/24.
//

import Foundation

/**
 A struct representing the response data format for the API endpoint that retrieves a list of meals.
 * `meals`: An array of `Meal` structs, each representing a meal retrieved from the API.
 */
struct MealResponse: Codable {
    let meals: [Meal]
}

/**
 A struct representing a meal retrieved from the API.
 * `strMeal`: The name of the meal.
 * `strMealThumb`: The URL of the meal's thumbnail image.
 * `id`: The unique identifier of the meal (stored in the "idMeal" key during decoding).
 */
struct Meal: Codable, Identifiable {
    let strMeal: String
    let strMealThumb: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case strMeal
        case strMealThumb
        case id = "idMeal"
    }
}
