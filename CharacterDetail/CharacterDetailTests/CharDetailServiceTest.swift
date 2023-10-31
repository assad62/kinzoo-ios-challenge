//
//  CharDetailServiceTest.swift
//  CharacterDetailTests
//
//  Created by Development on 31/10/2023.
//

import Foundation
import XCTest
import RemoteAPI
import Combine

@testable import CharacterDetail

final class CharDetailServiceTests: XCTestCase {
    private var cancellables: Set<AnyCancellable>!
    var sut:CharDetailDecorator?
    var data:CharDetailDTO?
    var error: Error?
    
    override func setUpWithError() throws {
        cancellables = []
    }
    
    
    func test_success_condition(){
        sut =  MockApiSuccessService(httpClient: URLSession.shared)
        let expectation = self.expectation(description: "API Success")
        let response = sut?.loadDetails(request: URLRequest(url: URL(string: "https://www.mytesturl.com")!))
        
         response?.sink(receiveCompletion: { completion in
            switch completion {
                            case .finished:
                                break
                            case .failure(let encounteredError):
                                self.error = encounteredError
                            }
            expectation.fulfill()
            
        }, receiveValue: { value in
            self.data = value
        }).store(in: &cancellables)
        
        waitForExpectations(timeout: 10)
       
        XCTAssertNotNil(data)
        XCTAssertNil(error)
        
    }
    
    func test_error_condition(){
        sut = MockApiFailService(httpClient: URLSession.shared)
        let expectation = self.expectation(description: "API Failure")
        
        
        let response = sut?.loadDetails(request: URLRequest(url: URL(string: "https://www.mytesturl.com")!))
        
         response?.sink(receiveCompletion: { completion in
            switch completion {
                            case .finished:
                                break
                            case .failure(let encounteredError):
                                self.error = encounteredError
                            }
            expectation.fulfill()
            
        }, receiveValue: { value in
            self.data = value
        }).store(in: &cancellables)
        
        waitForExpectations(timeout: 10)
       
        XCTAssertNil(data)
        XCTAssertNotNil(error)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        cancellables = nil
    }
}
    
