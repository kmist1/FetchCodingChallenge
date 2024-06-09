//
//  MealsNetworkService.swift
//  FetchCodingChallenge
//
//  Created by Krunal Mistry on 6/8/24.
//

import Foundation

// Responsible to fetch meals data and perform heavy work
protocol MealsNetworkManagerProtocol {
    func fetchMeals(with url: String) async throws -> [Meal] 
    func fetchMealDetails(with url: String) async throws -> [Recipe]
}
