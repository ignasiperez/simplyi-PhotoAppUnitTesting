//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Ignasi Perez-Valls on 3/10/23.
//

import XCTest
@testable import PhotoApp

final class SignupWebServiceTests: XCTestCase {

    override func setUp() { }

    override func tearDown()  { }
    
    func test_SignupWebService_WhenGivenSuccessFullResponse_ReturnsSuccess() {
        // GIVEN
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        let sut = SignupWebService(
            urlString: "https://tlyqhtlbn8.execute-api.us-east-1.amazonaws.com/prod/signup-mock-service/users"
        )
        
        let signupFormRequestModel = SignupFormRequestModel(
            firstName: "Ignasi",
            lastName: "Perez",
            email: "ignasi@test.com",
            password: "87654321"
        )
        
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        // WHEN
        sut.signup(withForm: signupFormRequestModel) { 
            (signupResponseModel, error) in
            // THEN
            // "{\"status\":\"ok\"}"
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
        
    } // test_SignupWebService_WhenGivenSuccessFullResponse_ReturnsSuccess()

} // SignupWebServiceTests




// HTTP body - Content-Type: application/json
//        {
//            "firstName": "Ignasi",
//            "lastName": "Perez",
//            "email": "ignasi@test.com",
//            "password": "87654321"
//        }

//// Terminal:
//curl --location --request POST 'https://tlyqhtlbn8.execute-api.us-east-1.amazonaws.com/prod/signup-mock-service/users' \
//--header 'Content-Type: application/json' \
//--data-raw '{
//    "firstName":"Sergey",
//    "lastName":"Kargopolov",
//    "email":"test@test.com",
//    "password":"12345678"
//}'


