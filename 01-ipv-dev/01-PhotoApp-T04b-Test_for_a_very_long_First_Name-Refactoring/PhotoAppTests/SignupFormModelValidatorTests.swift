//
//  SignupFormModelValidatorTests.swift
//  PhotoAppTests
//
//  Created by Ignasi Perez-Valls on 10/9/23.
//

import XCTest
@testable import PhotoApp

final class SignupFormModelValidatorTests: XCTestCase {
    
    var sut: SignupFormModelValidator!
    
    override func setUp() {
        sut = SignupFormModelValidator()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_SignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        // GIVEN
//      let sut = SignFormModelValidator()
        
        // WHEN
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Ignasi")
        
        // THEN
        XCTAssertTrue(isFirstNameValid,
                      "The isFirstNameValid() should have returned TRUE for a valid first name")
    } // test_SignFormModelValidator_whenValidFirstNameProvided_shouldReturnTrue()
    
    func test_SignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        // GIVEN
//      let sut = SignupFormModelValidator()
        
        // WHEN
        let isFirstNameValid = sut.isFirstNameValid(firstName: "I")
        
        // THEN
        XCTAssertFalse(isFirstNameValid,
                       "The isFirstNameValid() should have returned FALSE for a first name shorter than two characters")
    } // test_SignupFormModelValidator_whenTooShortFirstNameProvided_shouldReturnFalse()
    
    func test_SignupFormModelValidator_WhenTooLonmgtFirstNameProvided_ShouldReturnFalse() {
        // GIVEN
        // WHEN
        let isFirstNameValid = sut.isFirstNameValid(firstName: "IgnasiIgnasi")
        
        // THEN
        XCTAssertFalse(isFirstNameValid,
                       "The isFirstNameValid() should have returned FALSE for a first name longer than two ten characters")
    } // test_SignFormModelValidator_whenTooShortFirstNameProvided_shouldReturnFalse()
    
} // SignupFormModelValidatorTests
