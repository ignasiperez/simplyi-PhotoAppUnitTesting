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
//      let sut = SignupPresenter()
        let sut = SignupPresenter(formModelValidator: mockSignupModelValidator)
        
        // WHEN
        sut.processUserSignup(forModel: signupFormModel)
        
        // THEN
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated)
        
    } // test_SignupPresenter_WhenInformationProvided_WillValidateEachProperty()

} // SignupPresenterTests
