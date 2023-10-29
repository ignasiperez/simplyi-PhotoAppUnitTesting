//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Ignasi Perez-Valls on 3/10/23.
//

import XCTest
@testable import PhotoApp

final class SignupWebServiceTests: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown()  {
    
    }
    
    func test_SignupWebService_WhenGivenSuccessFullResponse_ReturnsSuccess() {
        // GIVEN
        let sut = SignupWebService(
            urlString: "https://bit.ly/signup-mock-service-users"
        )
        
        let signupFormRequestModel = SignupFormRequestModel(
            firstName: "Ignasi",
            lastName: "Perez",
            email: "test@test.com",
            password: "12345678"
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
