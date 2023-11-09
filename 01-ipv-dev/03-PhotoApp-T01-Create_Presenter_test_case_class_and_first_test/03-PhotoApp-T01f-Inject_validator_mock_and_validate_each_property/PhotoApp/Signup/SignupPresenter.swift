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
    }
    
} // SignupPresenter
