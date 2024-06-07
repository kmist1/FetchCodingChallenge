//
//  NetworkError.swift
//  FetchCodingChallenge
//
//  Created by Krunal Mistry on 6/7/24.
//

import Foundation

//  It represents various network-related errors that can occur during the
//  execution of network requests. Each case provides a user-friendly description
//  through the localizedDescription.
enum NetworkError: Error {

    case invalidURL
    case dataRequestFailed(Error)
    case statusCode(Int)
    case decodingError(Error)
    case unknownError

    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case let .dataRequestFailed(error):
            return "Data request failed with error: \(error.localizedDescription)"
        case let .statusCode(code):
            return "Network request failed with status code: \(code)"
        case let .decodingError(error):
            return "Error decoding response: \(error.localizedDescription)"
        case .unknownError:
            return "An unknown network error occurred."
        }
    }
}
