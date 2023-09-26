//
//  SignupFormModelValidatorTests.swift
//  PhotoAppTests
//
//  Created by Ignasi Perez-Valls on 10/9/23.
//

import XCTest
@testable import PhotoApp

final class SignupFormModelValidatorTests: XCTestCase {
    
    override func setUpWithError() throws { }
    
    override func tearDownWithError() throws { }
    
    func test_SignFormModelValidator_whenValidFirstNameProvided_shouldReturnTrue() {
        // GIVEN
        let sut = SignFormModelValidator()
        
        // WHEN
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Ignasi")
        
        // THEN
        XCTAssertTrue(isFirstNameValid,
                      "The isFirstNameValid() should have returned TRUE for a valid first name")
    } // test_SignFormModelValidator_whenValidFirstNameProvided_shouldReturnTrue()
    
    func test_SignFormModelValidator_whenTooShortFirstNameProvided_shouldReturnFalse() {
        // GIVEN
        let sut = SignFormModelValidator()
        
        // WHEN
        let isFirstNameValid = sut.isFirstNameValid(firstName: "I")
        
        // THEN
        XCTAssertFalse(isFirstNameValid,
                       "The isFirstNameValid() should have returned FALSE for a first name shorter than two two characters")
    } // test_SignFormModelValidator_whenTooShortFirstNameProvided_shouldReturnFalse()
    
} // SignupFormModelValidatorTests
