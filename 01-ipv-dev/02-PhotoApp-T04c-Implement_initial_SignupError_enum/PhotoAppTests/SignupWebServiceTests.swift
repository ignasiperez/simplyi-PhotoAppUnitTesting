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
        let sut = SignupWebService()
        
        let signupFormRequestModel = SignupFormRequestModel(
            firstName: "Ignasi",
            lastName: "Perez",
            email: "test@test.com",
            password: "12345678"
        )
        
        // WHEN
//      sut.signup(withForm: signupFormRequestModel)
        sut.signup(withForm: signupFormRequestModel) { 
            (signupResponseModel, error) in
            
        }
        
    } // test_SignupWebService_WhenGivenSuccessFullResponse_ReturnsSuccess()

} // SignupWebServiceTests
