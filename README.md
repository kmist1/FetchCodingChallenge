# FetchCodingChallenge
This project is a coding challenge that focuses on fetching and displaying desserts and dessert recipes using Swift, SwiftUI, and Combine. The application features a network layer, a view model, and a simple user interface for displaying dessert details.

![Simulator Screen Recording - iPhone 15 - 2024-06-10 at 16 37 01](https://github.com/kmist1/FetchCodingChallenge/assets/43079622/93db64e7-174a-40a1-b8e4-4b3caecfc518)

There are 2 endpoints that your app utilizes:
• https://themealdb.com/api/json/v1/1/filter.php?c=Dessert for fetching the
list of meals in the Dessert category.
• https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID for fetching the meal details by its ID. 

### Project Requirements

- [x] The user should be shown the list of meals in the Dessert category, sorted
alphabetically.
When the user selects a meal, they should be taken to a detail view that
includes:
      1. Meal name 
      2. Instructions
      3. Ingredients/measurements

- [x] Be sure to filter out any null or empty values from the API before displaying
them.
- [x] should take basic app design principles into account.
- [x] The Project should compile using the latest version of Xcode. 

## Project Structure
The project consists of the following components:

### Network Layer
NetworkManager: A singleton class responsible for handling network requests and data fetching operations. This class utilizes Combine's async/await syntax for asynchronous network calls and error handling.

### View Model
MealListViewModel: Responsible for managing the business logic related to the dessert list. It uses NetworkManager to fetch a list of desserts and updates the UI accordingly.
RecipeViewModel: Responsible for managing the business logic related to dessert recipes. It uses NetworkManager to fetch dessert details and updates the UI accordingly.

### Models
Meal: A struct representing meals retrieved from the API.
Recipe: Represents a meal recipe with properties such as id, strMeal, strCategory, strArea, strInstructions, strMealThumb, ingredients, and measures.

## Usage
The main view of the application displays a list of desserts. Selecting a dessert will display detailed information about the recipe, including ingredients and instructions.

## Run the Application
To run the project, follow these steps:

1. Clone the repository.
2. Open the project in Xcode.
3. Build and run the project using the latest version of Xcode.

## Testing
To run the unit tests for this project:

1. Open the project in Xcode.
2. Select the FetchCodingChallengeTests scheme.
3. Press Command-U to run the tests.
![Screenshot 2024-06-10 at 4 34 23 PM](https://github.com/kmist1/FetchCodingChallenge/assets/43079622/6f41ad7d-7c68-441c-9df0-ea2e32427b20)


