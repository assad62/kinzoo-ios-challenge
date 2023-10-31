//
//  Kinzoo_iOS_ChallengeTests.swift
//  Kinzoo-iOS-ChallengeTests
//
//  Created by Development on 28/10/2023.
//

import XCTest
@testable import Kinzoo_iOS_Challenge

final class Kinzoo_iOS_ChallengeTests: XCTestCase {

    var sut:AppConfiguration?
    override func setUpWithError() throws {
       
        
        sut = AppConfiguration(baseUrl: "http://www.google.com")
        
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBaseUrl() throws {
       
        XCTAssertNotNil(sut?.getBaseUrl())
        XCTAssertEqual(sut?.getBaseUrl(), "http://www.google.com")
    }

   

}
