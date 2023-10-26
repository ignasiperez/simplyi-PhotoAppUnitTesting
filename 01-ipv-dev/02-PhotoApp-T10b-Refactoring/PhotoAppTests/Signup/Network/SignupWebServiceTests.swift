//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Ignasi Perez-Valls on 3/10/23.
//

import XCTest
@testable import PhotoApp

final class SignupWebServiceTests: XCTestCase {
    
    var sut: SignupWebService!
    var signupFormRequestModel: SignupFormRequestModel!
    
    override func setUp() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = SignupWebService(
            urlString: SignupConstants.signUpURLString,
            urlSession: urlSession
        )
        
        signupFormRequestModel = SignupFormRequestModel(
            firstName: "Ignasi",
            lastName: "Perez",
            email: "ignasi@test.com",
            password: "87654321"
        )
    }

    override func tearDown()  {
        sut = nil
        signupFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
    }
    
    func test_SignupWebService_WhenGivenSuccessFullResponse_ReturnsSuccess() {
        // GIVEN
//        let config = URLSessionConfiguration.ephemeral
//        config.protocolClasses = [MockURLProtocol.self]
//        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
//        let sut = SignupWebService(
//            urlString: SignupConstants.signUpURLString,
//            urlSession: urlSession
//        )
//        
//        let signupFormRequestModel = SignupFormRequestModel(
//            firstName: "Ignasi",
//            lastName: "Perez",
//            email: "ignasi@test.com",
//            password: "87654321"
//        )
        
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
//        let config = URLSessionConfiguration.ephemeral
//        config.protocolClasses = [MockURLProtocol.self]
//        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"path\":\"users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
//        let sut = SignupWebService(
//            urlString: SignupConstants.signUpURLString,
//            urlSession: urlSession
//        )
//        
//        let signupFormRequestModel = SignupFormRequestModel(
//            firstName: "Ignasi",
//            lastName: "Perez",
//            email: "ignasi@test.com",
//            password: "87654321"
//        )
        
//      let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON structure")
        
        // WHEN
        sut.signup(withForm: signupFormRequestModel) {
            (signupResponseModel, error) in
            // THEN
//          XCTAssertNil(signupResponseModel)
            XCTAssertNil(
                signupResponseModel,
                "The response model for a request containing unknown JSON response, should have been nil"
            )
//          XCTAssertEqual(error, SignupError.responseModelParsingError)
            XCTAssertEqual(
                error,
                SignupError.responseModelParsingError,
                "The signup() method did not return expected error"
            )
            
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


