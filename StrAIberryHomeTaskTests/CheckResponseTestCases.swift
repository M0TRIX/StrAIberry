//
//  HomeTaskTests.swift
//  HomeTaskTests
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import XCTest
@testable import StrAIberryHomeTask

class CheckResponseTestCases: XCTestCase {
    
    var url = URL(string: "test")!
    var object = Photos()
    var photo = Photo()

    override func tearDown() {
        testCheckResponseWithSuccess()
        testCheckResponseWithForbidden()
        testCheckResponseWithBadRequest()
        testCheckResponseWithInvalidResponse()
    }
    
    func testCheckResponseWithSuccess(){
        
        photo.secret = "1"
        photo.server = "2"
        photo.id = "3"
        object.page = 1
        object.photo = [photo]
        
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: "", headerFields: ["":""])
        let result = ServiceValidator.checkResposnse(response: response!, value: object)
        XCTAssertEqual(result, ServiceError.SUCCESS)
    }
    
    func testCheckResponseWithForbidden(){
        photo.secret = "1"
        photo.server = "2"
        photo.id = "3"
        object.page = 1
        object.photo = [photo]
        
        let response = HTTPURLResponse(url: url, statusCode: 402, httpVersion: "", headerFields: ["":""])
        let result = ServiceValidator.checkResposnse(response: response!, value: object)
        XCTAssertEqual(result, ServiceError.FORBIDDEN)
    }
    
    func testCheckResponseWithBadRequest(){
        photo.secret = "1"
        photo.server = "2"
        photo.id = "3"
        object.page = 1
        object.photo = [photo]
        
        let response = HTTPURLResponse(url: url, statusCode: 400, httpVersion: "", headerFields: ["":""])
        let result = ServiceValidator.checkResposnse(response: response!, value: object)
        XCTAssertEqual(result, ServiceError.BADREQUEST)
    }
    
    func testCheckResponseWithInvalidResponse(){
        let response = HTTPURLResponse(url: url, statusCode: 400, httpVersion: "", headerFields: ["":""])
        let result = ServiceValidator.checkResposnse(response: response!, value: nil)
        XCTAssertEqual(result, ServiceError.INVALIDRESPONSE)
    }
    
    func testCheckResponseWithUNAUTHORIZE(){
        photo.secret = "1"
        photo.server = "2"
        photo.id = "3"
        object.page = 1
        object.photo = [photo]
        
        let response = HTTPURLResponse(url: url, statusCode: 401, httpVersion: "", headerFields: ["":""])
        let result = ServiceValidator.checkResposnse(response: response!, value: object)
        XCTAssertEqual(result, ServiceError.UNAUTHORIZE)
    }
    
    func testCheckResponseWithServerError(){
        photo.secret = "1"
        photo.server = "2"
        photo.id = "3"
        object.page = 1
        object.photo = [photo]
        
        let response = HTTPURLResponse(url: url, statusCode: 500, httpVersion: "", headerFields: ["":""])
        let result = ServiceValidator.checkResposnse(response: response!, value: object)
        XCTAssertEqual(result, ServiceError.SERVERERROR)
    }
  
}
