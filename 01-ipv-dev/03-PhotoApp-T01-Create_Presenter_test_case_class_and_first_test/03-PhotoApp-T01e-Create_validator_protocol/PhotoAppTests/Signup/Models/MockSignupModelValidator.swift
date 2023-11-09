//
//  MockSignupModelValidator.swift
//  PhotoApp
//
//  Created by Ignasi Perez-Valls on 6/11/23.
//

import Foundation
@testable import PhotoApp

class MockSignupModelValidator: SignupModelValidatorProtocol {
    
    var isFirstNameValidated: Bool = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        return true
    }
    
    func isEmailValid(email: String) -> Bool {
        return true
    }
    
    func isPasswordValid(password: String) -> Bool {
        return true
    }
    
    func doPasswordsMatch(password: String, repeatPassWord: String) -> Bool {
        return true
    }
    
}
