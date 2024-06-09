//
//  Recipe.swift
//  FetchCodingChallenge
//
//  Created by Krunal Mistry on 6/7/24.
//

import Foundation

/**
 A struct representing the response data format for the API endpoint that retrieves a list of recipes.
 * `meals`: An array of `Recipe` structs, each representing a recipe retrieved from the API.
 */
struct RecipeResponse: Decodable {
    let meals: [Recipe]
}

/**
 A struct representing a recipe retrieved from the API.
 * `id`: The unique identifier of the recipe (stored in the "idMeal" key during decoding).
 * `strMeal`: The name of the recipe.
 * `strCategory`: The category of the recipe (e.g., "Dessert", "Seafood").
 * `strArea`: The region or origin of the recipe (e.g., "Italian", "Indian").
 * `strInstructions`: The recipe's instructions.
 * `strMealThumb`: The URL of the recipe's thumbnail image.
 * `ingredients`: An array of strings representing the recipe's ingredients.
 * `measures`: An array of strings representing the corresponding quantities or measurements for each ingredient.
 */
struct Recipe: Decodable, Identifiable {
    let id: String
    let strMeal: String
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    var ingredients: [String]
    var measures: [String]

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal
        case strCategory
        case strArea
        case strInstructions
        case strMealThumb
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strCategory = try container.decode(String.self, forKey: .strCategory)
        strArea = try container.decode(String.self, forKey: .strArea)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)
        strMealThumb = try container.decode(String.self, forKey: .strMealThumb)

        ingredients = try (1...20).compactMap { index in
            let ingredientKey = CodingKeys(rawValue: "strIngredient\(index)")
            if let ingredientKey, let ingredient = try container.decodeIfPresent(String.self, forKey: ingredientKey) {
                return ingredient
            }
            return ""
        }
        
        measures = try (1...20).compactMap { index in
            let measureKey = CodingKeys(rawValue: "strMeasure\(index)")
            if let measureKey, let measure = try container.decodeIfPresent(String.self, forKey: measureKey) {
                return measure
            }
            return ""
        }

        // filter out empty values for any ingredients and measures.
        ingredients = ingredients.filter({ !$0.isEmpty })
        measures = measures.filter({ !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }) // ensures that strings that only contain whitespace are also removed.
    }
}
