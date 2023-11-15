//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Ignasi Perez-Valls on 6/11/23.
//

import XCTest
@testable import PhotoApp

final class SignupPresenterTests: XCTestCase {

    override func setUp() { }

    override func tearDown() { }
    
    func test_SignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // GIVEN
        let signupFormModel = SignupFormModel(firstName: "Ignasi",
                                              lastName: "Perez",
                                              email: "ignasi@gmail.com",
                                              password: "12345678",
                                              repeatPassword: "12345678")
        
        let mockSignupModelValidator = MockSignupModelValidator()
        let sut = SignupPresenter(formModelValidator: mockSignupModelValidator)
        
        // WHEN
        sut.processUserSignup(forModel: signupFormModel)
       
        // THEN
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated,
                      "First name is not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated,
                      "Last name is not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated,
                      "Email is not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated,
                      "Password is not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordEqualityValidated,
                      "Password equality is not validated")
        
    } // test_SignupPresenter_WhenInformationProvided_WillValidateEachProperty()
    
    
    func test_SignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        // GIVEN
        let signupFormModel = SignupFormModel(firstName: "Ignasi",
                                              lastName: "Perez",
                                              email: "ignasi@gmail.com",
                                              password: "12345678",
                                              repeatPassword: "12345678")
        
        let mockSignupModelValidator = MockSignupModelValidator()
        
        let mockSignupWebService = MocksignupWebService()
        
        let sut = SignupPresenter(formModelValidator: mockSignupModelValidator)
        
        // WHEN
        sut.processUserSignup(forModel: signupFormModel)
        
        
        // THEN
        XCTAssertTrue(
            mockSignupWebService.isSignupMethodCalled,
            "The signup() method was not called in the SignupWebService class"
        )
    }

} // SignupPresenterTests
