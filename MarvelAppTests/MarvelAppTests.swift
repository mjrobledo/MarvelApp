//
//
// MarvelAppTests.swift
// MarvelAppTests
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 28/09/21.
// Copyright (c) 2021 and Confidential to ___ORGANIZATIONNAME___ All rights reserved.
//


import XCTest
@testable import MarvelApp

class MarvelAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testApiContent() throws {        
        let manager = DataManager()
        var req = RequestModel()
        req.offset = 0
        req.limit = 0
        manager.getContent(request: req) { (response) in
            if let results = response?.data?.results {
                XCTAssertNotNil(results)
                XCTAssertFalse(results.isEmpty)
                XCTAssertEqual(results.count, 50)
            }
        }
    }
    
    func testResultServiceLimit10() {
        var results:[Results]?
        let manager = DataManager()
        var req = RequestModel()
        req.offset = 0
        req.limit = 30
        let expectations = expectation(description: "Test With Limit 30")
        manager.getContent(request: req) { (response) in
            print()
            results = response?.data?.results
            expectations.fulfill()
        }
           
        
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNotNil(results)
            XCTAssertFalse(results!.isEmpty)
            XCTAssertEqual(results!.count, 30)
        }
    }

    func testValidCharacterId() {
        let expectations = expectation(description: "Valid CharacterId")
        var result:Results?
        
        let manager = DataManager()
        let request = RequestModel()
        manager.getContent(characterId: 1010755, request: request) { (response) in
            if let resultData = response?.data?.results?.first {
                result = resultData
                expectations.fulfill()
            } else {
                XCTAssertFalse(result == nil)
            }
        }
                
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertFalse(result == nil)
            XCTAssertEqual(result?.id!, 1010755)
        }
    }
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
