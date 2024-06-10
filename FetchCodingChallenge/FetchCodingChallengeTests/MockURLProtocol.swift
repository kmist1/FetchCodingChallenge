//
//  MockURLProtocol.swift
//  FetchCodingChallengeTests
//
//  Created by Krunal Mistry on 6/9/24.
//

import Foundation

final class MockURLProtocol: URLProtocol {
    static var mockResponses: [URL: (response: HTTPURLResponse, data: Data)] = [:]

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        if let url = request.url, let mockResponse = MockURLProtocol.mockResponses[url] {
            client?.urlProtocol(self, didReceive: mockResponse.response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: mockResponse.data)
        } else {
            client?.urlProtocol(self, didFailWithError: URLError(.badURL))
        }
        client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
}
