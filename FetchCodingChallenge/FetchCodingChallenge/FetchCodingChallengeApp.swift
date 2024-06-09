//
//  FetchCodingChallengeApp.swift
//  FetchCodingChallenge
//
//  Created by Krunal Mistry on 6/6/24.
//

import SwiftUI

@main
struct FetchCodingChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            HomePageView(mealListViewModel: MealListViewModel())
        }
    }
}
