//
//  FetchCodingChallengeTests.swift
//  FetchCodingChallengeTests
//
//  Created by Krunal Mistry on 6/6/24.
//

import XCTest
@testable import FetchCodingChallenge

final class RecipeViewModelTests: XCTestCase {
    var viewModel: RecipeViewModel!
    var recipe: Recipe!

    override func setUp() {
        super.setUp()
        recipe = Recipe(
                    id: "53049",
                    strMeal: "Apam balik",
                    strCategory: "Dessert",
                    strArea: "Malaysian",
                    strInstructions: "Bake it.", 
                    strMealThumb: "https://example.com/apple_pie.jpg",
                    ingredients: ["Apple", "Sugar"],
                    measures: ["2", "1 cup"]
                )
        viewModel = RecipeViewModel(receipe: recipe)
    }

    override func tearDown() {
        viewModel = nil
        recipe = nil
        super.tearDown()
    }

    func testRecipeName() {
        XCTAssertEqual(viewModel.recipeName, "Apam balik")
    }

    func testRecipeImageUrl() {
        XCTAssertEqual(viewModel.recipeImageUrl, "https://example.com/apple_pie.jpg")
    }

    func testRecipeInstruction() {
        XCTAssertEqual(viewModel.recipeInstruction, "Bake it.")
    }

    func testRecipeIngredients() {
        XCTAssertEqual(viewModel.recipeIngredients, ["Apple: 2", "Sugar: 1 cup"])
    }

    func testRecipeNameWhenRecipeIsNil() {
        viewModel = RecipeViewModel(receipe: nil)
        XCTAssertEqual(viewModel.recipeName, "Name Not Available")
    }

    func testRecipeImageUrlWhenRecipeIsNil() {
        viewModel = RecipeViewModel(receipe: nil)
        XCTAssertEqual(viewModel.recipeImageUrl, "")
    }

    func testRecipeInstructionWhenRecipeIsNil() {
        viewModel = RecipeViewModel(receipe: nil)
        XCTAssertEqual(viewModel.recipeInstruction, "Instructions Not Available")
    }

    func testRecipeIngredientsWhenRecipeIsNil() {
        viewModel = RecipeViewModel(receipe: nil)
        XCTAssertTrue(viewModel.recipeIngredients.isEmpty)
    }
}

