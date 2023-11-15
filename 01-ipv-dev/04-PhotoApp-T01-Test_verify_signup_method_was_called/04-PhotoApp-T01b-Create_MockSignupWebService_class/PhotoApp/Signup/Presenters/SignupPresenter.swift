//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Ignasi Perez-Valls on 6/11/23.
//

import Foundation

class SignupPresenter {
    
    private var formModelValidator: SignupModelValidatorProtocol
    
    init(formModelValidator: SignupModelValidatorProtocol) {
        self.formModelValidator = formModelValidator
    }
    
    func processUserSignup(forModel: SignupFormModel) {
        if !formModelValidator.isFirstNameValid(firstName: forModel.firstName) {
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: forModel.lastName) {
            return
        }
        
        if !formModelValidator.isEmailValid(email: forModel.email) {
            return
        }
        
        if !formModelValidator.isPasswordValid(password: forModel.password) {
            return
        }
        
        if !formModelValidator.doPasswordsMatch(
            password: forModel.password,
            repeatPassWord: forModel.repeatPassword
        ) {
            return
        }
        
    } // processUserSignup(forModel:)
    
} // SignupPresenter
