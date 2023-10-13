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
    
    
    // MARK: Test first name
    
    func test_SignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        // GIVEN & WHEN
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Ignasi")
        
        // THEN
        XCTAssertTrue(isFirstNameValid,
                      "The isFirstNameValid() should have returned TRUE for a valid first name"
        )
    } // test_SignFormModelValidator_whenValidFirstNameProvided_shouldReturnTrue()
    
    func test_SignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        // GIVEN & WHEN
        
        // WHEN
        let isFirstNameValid = sut.isFirstNameValid(firstName: "I")
        
        // THEN
        XCTAssertFalse(isFirstNameValid,
                       "The isFirstNameValid() should have returned FALSE for a first name shorter than \(K.SignupConstants.firstNameMinLength) characters"
        )
    } // test_SignupFormModelValidator_whenTooShortFirstNameProvided_shouldReturnFalse()
    
    func test_SignupFormModelValidator_WhenTooLongtFirstNameProvided_ShouldReturnFalse() {
        // GIVEN & WHEN
        let isFirstNameValid = sut.isFirstNameValid(firstName: "IgnasiIgnasi")
        
        // THEN
        XCTAssertFalse(isFirstNameValid,
                       "The isFirstNameValid() should have returned FALSE for a first name longer than \(K.SignupConstants.firstNameMaxLenght) characters"
        )
    } // test_SignFormModelValidator_whenTooLongFirstNameProvided_shouldReturnFalse()
    
    
    // MARK: Test last name
    
    func test_SignupFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        // GIVEN & WHEN
        let isLastNameValid = sut.isLastNameValid(lastName: "Perez")
        
        // THEN
        XCTAssertTrue(isLastNameValid,
                      "The isLastNameValid() should have returned TRUE for a valid last name"
        )
    } // test_SignFormModelValidator_whenValidLastNameProvided_shouldReturnTrue()
    
    func test_SignupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        // GIVEN & WHEN
        
        // WHEN
        let isLastNameValid = sut.isLastNameValid(lastName: "P")
        
        // THEN
        XCTAssertFalse(isLastNameValid,
                       "The isLastNameValid() should have returned FALSE for a last name shorter than \(K.SignupConstants.lastNameMinLength) characters"
        )
    } // test_SignupFormModelValidator_whenTooShortLastNameProvided_shouldReturnFalse()
    
    func test_SignupFormModelValidator_WhenTooLongtLastNameProvided_ShouldReturnFalse() {
        // GIVEN & WHEN
        let isLastNameValid = sut.isLastNameValid(lastName: "PerezPerezPerez")
        
        // THEN
        XCTAssertFalse(isLastNameValid,
                       "The isLastNameValid() should have returned FALSE for a last name longer than \(K.SignupConstants.lastNameMaxLenght) characters"
        )
    } // test_SignFormModelValidator_whenTooLongLastNameProvided_shouldReturnFalse()
    
    
    // MARK: Test email
    
    func test_SignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        // GIVEN & WHEN
        let isEmailValid = sut.isEmailValid(email: "ignasi@gmail.com")
        
        // THEN
        XCTAssertTrue(isEmailValid,
                      "The isEmailValid() should have returned TRUE for a valid email"
        )
    } // test_SignFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue()
    
    
    // MARK: Test password
    
    func test_SignupFormModelValidator_WhenValidPasswordProvided_ShouldReturnTrue() {
        // GIVEN & WHEN
        let isPasswordValid = sut.isPasswordValid(password: "12345678")
        
        // THEN
        XCTAssertTrue(isPasswordValid,
            "The isPasswordValid() should have returned TRUE for a valid password"
        )
    } // test_SignFormModelValidator_whenValidFirstNameProvided_shouldReturnTrue()
    
    func test_SignupFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnTrue() {
        // GIVEN & WHEN
        let isPasswordValid = sut.isPasswordValid(password: "123")
        
        // THEN
        XCTAssertFalse(isPasswordValid,
                       "The isPasswordValid() should have returned FALSE for a password shorter than \(K.SignupConstants.passwordMinLenght) characters"
        )
    } // test_SignFormModelValidator_whenValidFirstNameProvided_shouldReturnTrue()
    
    func test_SignupFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        // GIVEN & WHEN
        let isPasswordValid = sut.isPasswordValid(password: "1234567890123456789012345678901234")
        
        // THEN
        XCTAssertFalse(isPasswordValid,
                       "The isPasswordValid() should have returned FALSE for a password longer than \(K.SignupConstants.passwordMaxLenght) characters"
        )
    } // test_SignFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnTrue()
    
    func test_SignupFormModelValidator_WhenEqualPasswordsProvided_ShouldReturnTrue() {
        // GIVEN & WHEN
        let doPasswordsMatch = sut.doPasswordsMatch(password: "12345678",
                                                   repeatPassWord: "12345678")
        
        // THEN
        XCTAssertTrue(doPasswordsMatch,
                       "The doPasseordsMatch() should have returned TRUE for matching passwords."
        )
    } // test_SignFormModelValidator_WhenEqualPasswordsProvided_ShouldReturnTrue()
    
    func test_SignupFormModelValidator_WhenNotMatchingPasswordsProvided_ShouldReturnFalse() {
        // GIVEN & WHEN
        let doPasswordsMatch = sut.doPasswordsMatch(password: "12345678",
                                                   repeatPassWord: "55555555")
        
        // THEN
        XCTAssertFalse(doPasswordsMatch,
                       "The doPasseordsMatch() should have returned FALSE for not matching passwords."
        )
    } // test_SignFormModelValidator_WhenNotMatchingPasswordsProvided_ShouldReturnTrue()
    
    
} // SignupFormModelValidatorTests
