//
//  NetworkManagerTests.swift
//  FetchCodingChallengeTests
//
//  Created by Krunal Mistry on 6/9/24.
//

import XCTest
@testable import FetchCodingChallenge

final class NetworkManagerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        NetworkManager.shared.updateSessionForTest(session: URLSession(configuration: config))
    }

    override func tearDown() {
        MockURLProtocol.mockResponses = [:]
        super.tearDown()
    }

    func testFetchMealsSuccess() async throws {
        let url = URL(string: "https://mockurl.com/meals")!
        let jsonResponse = """
        {
            "meals": [
                {"idMeal": "1", "strMeal": "Carrot Cake", "strMealThumb": ""},
                {"idMeal": "2", "strMeal": "Banana Bread", "strMealThumb": ""},
                {"idMeal": "3", "strMeal": "Apple Pie", "strMealThumb": ""}
            ]
        }
        """
        let responseData = jsonResponse.data(using: .utf8)!
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
        MockURLProtocol.mockResponses[url] = (response, responseData)

        let meals = try await NetworkManager.shared.fetchMeals(with: url.absoluteString)

        XCTAssertEqual(meals.count, 3)
        XCTAssertEqual(meals[0].strMeal, "Apple Pie")
        XCTAssertEqual(meals[1].strMeal, "Banana Bread")
        XCTAssertEqual(meals[2].strMeal, "Carrot Cake")
    }

    func testFetchMealsFailureInvalidURL() async {
        do {
            _ = try await NetworkManager.shared.fetchMeals(with: "")
            XCTFail("Expected to throw an error but did not")
        } catch {
            XCTAssertEqual(error as? NetworkError, NetworkError.invalidURL)
        }
    }

    func testFetchMealsFailureRequestError() async {
        let url = URL(string: "https://mockurl.com/meals")!
        MockURLProtocol.mockResponses[url] = nil

        do {
            _ = try await NetworkManager.shared.fetchMeals(with: url.absoluteString)
            XCTFail("Expected to throw an error but did not")
        } catch {
            XCTAssert(error is NetworkError)
        }
    }
}

