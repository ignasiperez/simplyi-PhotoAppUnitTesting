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
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let sut = SignupWebService(
            urlString: SignupConstants.signUpURLString,
            urlSession: urlSession
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
    
    func test_SignupWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        // GIVEN
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
//      let jsonString = "{\"status\":\"ok\"}"
        let jsonString = "{\"path\":\"users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let sut = SignupWebService(
            urlString: SignupConstants.signUpURLString,
            urlSession: urlSession
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
//          XCTAssertEqual(signupResponseModel?.status, "ok")
            XCTAssertNil(signupResponseModel)
            XCTAssertEqual(error, SignupError.responseModelParsingError)
            
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
        
    } // test_SignupWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace()

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


