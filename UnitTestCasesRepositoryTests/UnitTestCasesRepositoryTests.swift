//
//  UnitTestCasesRepositoryTests.swift
//  UnitTestCasesRepositoryTests
//
//  Created by user227716 on 11/2/22.
//

import XCTest
@testable import UnitTestCasesRepository

final class UnitTestCasesRepositoryTests: XCTestCase {
    override class func setUp() {
        print(#function)
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //print(#function)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
       // print(#function)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        print("Hello this is testExample")
    }

    func testCheckURLFunctionality() {
        
        let expectation = XCTestExpectation(description: "Expectation for network manager url")
        
        NetworkManager.shared.getAPIData() {
            result in
            
            XCTAssertEqual(result[0].character, "Mario", "Value did not match")
            
            XCTAssertNotNil(result[0].release.au)
            
            //MARK: -If we dont call this below function, this test method will always fail. Becausee calling fulfill stops test method to wait and as a result wait() function will not raise error.
            expectation.fulfill()
            
        }
        
        //MARK: - Not calling wait() method makes this test method pass all the time. Because it will never execute code block present in the closure of getAPIData()(It's a callback closure). And no statements of that closure block also executed. It will jujst like calling test method with no assertion statement in it.
        
        wait(for: [expectation], timeout: 10)
    
    }

    override class func tearDown() {
        print(#function)
    }
}
