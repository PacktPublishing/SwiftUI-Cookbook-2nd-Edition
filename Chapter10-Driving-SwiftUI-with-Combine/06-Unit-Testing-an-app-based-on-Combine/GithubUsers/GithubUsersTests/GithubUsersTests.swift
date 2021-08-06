//
//  GithubUsersTests.swift
//  GithubUsersTests
//
//  Created by Giordano Scalzo on 06/08/2021.
//

import XCTest
@testable import GithubUsers
import Combine
extension XCTestCase {
    func loadFixture(named name: String) -> Data? {
        let bundle = Bundle(for: type(of: self))
        let path = bundle.url(forResource: name, withExtension: "json")!
        return try? Data(contentsOf: path)
    }
}

final class MockURLProtocol: URLProtocol {
    
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data?))?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        guard let handler = MockURLProtocol.requestHandler else {
            fatalError("Handler is unavailable.")
        }
        
        do {
            let (response, data) = try handler(request)
            client?.urlProtocol(self, didReceive: response,
                                cacheStoragePolicy: .notAllowed)
            if let data = data {
                client?.urlProtocol(self, didLoad: data)
            }
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
    
    override func stopLoading() {
    }
}

extension XCTestCase {
    typealias CompletionResult = (expectation: XCTestExpectation,
        cancellable: AnyCancellable)
    func expectValue<T: Publisher>(of publisher: T,
                                   equalsTo closure: @escaping(T.Output) -> Bool)
        -> CompletionResult {
            let exp = expectation(description: "Correct values of " + String(describing: publisher))
            let cancellable = publisher
                .sink(receiveCompletion: { _ in },
                      receiveValue: {
                        if closure($0) {
                            exp.fulfill()
                        }
                })
            return (exp, cancellable)
    }
}

class GithubUsersAppTests: XCTestCase {
    let apiURL = URL(string: "https://api.github.com/users")!
    func testUsersCallResult() throws {
        // Arrange
        URLProtocol.registerClass(MockURLProtocol.self)
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: self.apiURL, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, self.loadFixture(named: "githubUsers")!)
        }
        
        let github = Github()
        
        let exp1 = expectValue(of: github.$users, equalsTo: { $0.first?.id ==  1 })
        let exp2 = expectValue(of: github.$users, equalsTo: { $0.count == 30})
        
        // Act
        github.load()
        
        // Assert
        wait(for: [exp1.expectation, exp2.expectation], timeout: 1)
    }
}
