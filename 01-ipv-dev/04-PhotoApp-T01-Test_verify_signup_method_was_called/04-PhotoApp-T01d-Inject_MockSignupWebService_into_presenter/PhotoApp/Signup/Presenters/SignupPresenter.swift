//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Ignasi Perez-Valls on 6/11/23.
//

import Foundation

class SignupPresenter {
    
    private var formModelValidator: SignupModelValidatorProtocol
    private var webservice: SignupWebServiceProtocol
    
//  init(formModelValidator: SignupModelValidatorProtocol) {
    init(formModelValidator: SignupModelValidatorProtocol,
         webservice: SignupWebServiceProtocol) {
        self.formModelValidator = formModelValidator
        self.webservice = webservice
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
        
        let requestModel = SignupFormRequestModel(
            firstName: forModel.firstName,
            lastName: forModel.lastName,
            email: forModel.email,
            password: forModel.password
        )
        
        webservice.signup(withForm: requestModel) { (responseModel, error) in
             #warning("TODO: ipv - ")
        }
    
    } // processUserSignup(forModel:)
    
} // SignupPresenter
