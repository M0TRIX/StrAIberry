//
//  StrAIberryHomeTaskTests.swift
//  StrAIberryHomeTaskTests
//
//  Created by Ali Asadi on 3/24/1401 AP.
//

import XCTest
@testable import StrAIberryHomeTask

class PhotosViewModelTestCases: XCTestCase {
    
    var ViewModel = PhotosViewModel(serviceApi: ServiceApi(), controller: UIViewController())
    
    override func tearDown() {
        testServiceApiWithNotNil()
        testMovieListWithNil()
    }
    
    func testServiceApiWithNotNil(){
        XCTAssertNotNil(ViewModel.serviceApi)
    }
    func testMovieListWithNil(){
        XCTAssertNil(ViewModel.photoList?.photo)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
