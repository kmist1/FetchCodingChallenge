//
//  Endpoints.swift
//  FetchCodingChallenge
//
//  Created by Krunal Mistry on 6/7/24.
//

import Foundation

/**
 An enum containing constants for API endpoints related to meals.
 This enum provides base URLs for filtering meals by category and fetching details of a specific meal.
 */
enum APIConstant {
    private enum Meals {
        static let filterByCategoryBase = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        static let lookupDetailsBase = "https://themealdb.com/api/json/v1/1/lookup.php?i="
    }

    static func getCategoryEndpoint() -> String {
        return Meals.filterByCategoryBase
    }

    static func getDetailsEndpoint() -> String {
        return Meals.lookupDetailsBase
    }
}
