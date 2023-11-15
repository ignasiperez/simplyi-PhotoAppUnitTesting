//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Ignasi Perez-Valls on 6/11/23.
//

import XCTest
@testable import PhotoApp

final class SignupPresenterTests: XCTestCase {
    
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var sut: SignupPresenter!
    
    override func setUp() {
        signupFormModel = SignupFormModel(firstName: "Ignasi",
                                          lastName: "Perez",
                                          email: "ignasi@gmail.com",
                                          password: "12345678",
                                          repeatPassword: "12345678")
        
        mockSignupModelValidator = MockSignupModelValidator()
        
        mockSignupWebService = MockSignupWebService()
        
        sut = SignupPresenter(
            formModelValidator: mockSignupModelValidator,
            webservice: mockSignupWebService
        )
        
    }
    
    override func tearDown() {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        sut = nil
    }
    
    func test_SignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // GIVEN
//      let signupFormModel = SignupFormModel(firstName: "Ignasi",
//                                            lastName: "Perez",
//                                            email: "ignasi@gmail.com",
//                                            password: "12345678",
//                                            repeatPassword: "12345678")
//
//      let mockSignupModelValidator = MockSignupModelValidator()
//
//      let mockSignupWebService = MockSignupWebService()
//
//      let sut = SignupPresenter(
//           formModelValidator: mockSignupModelValidator,
//           webservice: mockSignupWebService
//      )
        
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
//      let signupFormModel = SignupFormModel(firstName: "Ignasi",
//                                            lastName: "Perez",
//                                            email: "ignasi@gmail.com",
//                                            password: "12345678",
//                                            repeatPassword: "12345678")
//        
//      let mockSignupModelValidator = MockSignupModelValidator()
//
//      let mockSignupWebService = MockSignupWebService()
//        
//      let sut = SignupPresenter(
//           formModelValidator: mockSignupModelValidator,
//           webservice: mockSignupWebService
//      )
        
        // WHEN
        sut.processUserSignup(forModel: signupFormModel)
        
        
        // THEN
        XCTAssertTrue(
            mockSignupWebService.isSignupMethodCalled,
            "The signup() method was not called in the SignupWebService class"
        )
    }
    
} // SignupPresenterTests
