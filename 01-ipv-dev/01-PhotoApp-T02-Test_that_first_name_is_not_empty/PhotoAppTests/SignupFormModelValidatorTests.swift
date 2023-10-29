//
//  SignupFormModelValidatorTests.swift
//  PhotoAppTests
//
//  Created by Ignasi Perez-Valls on 10/9/23.
//

import XCTest
@testable import PhotoApp

final class SignupFormModelValidatorTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_SignFormModelValidator_whenValidFirstNameProvided_shouldReturnTrue() {
        // GIVEN
        let sut = SignFormModelValidator()
        
        // WHEN
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Ignasi")
        
        // THEN
        XCTAssertTrue(isFirstNameValid,
                      "The isFirstNameValid() should have returned TRUE for a valid first name")
    } // test_SignFormModelValidator_whenValidFirstNameProvided_shouldReturnTrue()
    
} // SignupFormModelValidatorTests
