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
        NavigationView {
            let columns = [
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
            GeometryReader { proxy in
                VStack {
                    Text("Desserts")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)

                    Divider()

                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(mealListViewModel.mealList) { meal in
                                NavigationLink(destination: MealDetailView(recipeViewModel: RecipeViewModel(), mealId: meal.id)) {
                                    MealItemCellView(meal: meal)
                                }
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
                .alert(isPresented: $mealListViewModel.shouldShowError, content: {
                    Alert(title: Text("Something is Wrong!"), message: Text(mealListViewModel.errorMessage), dismissButton: .cancel({ mealListViewModel.shouldShowError.toggle()
                    }))
                })
            }
        }
        .navigationTitle("Desserts")
    }
}

#Preview {
    HomePageView(mealListViewModel: MealListViewModel())
}
