//
//  ContentView.swift
//  FetchCodingChallenge
//
//  Created by Krunal Mistry on 6/6/24.
//

import SwiftUI

struct HomePageView: View {
    @ObservedObject var mealListViewModel: MealListViewModel

    var body: some View {
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        GeometryReader { proxy in
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(mealListViewModel.mealList) { meal in
                            MealItemCellView(meal: meal)
                        }
                    }
                    .padding()
                }
            }
            .padding()
            .onAppear(perform: {
                Task {
                    await mealListViewModel.getMeals()
                }
            })
        }
    }
}

#Preview {
    HomePageView(mealListViewModel: MealListViewModel())
}
