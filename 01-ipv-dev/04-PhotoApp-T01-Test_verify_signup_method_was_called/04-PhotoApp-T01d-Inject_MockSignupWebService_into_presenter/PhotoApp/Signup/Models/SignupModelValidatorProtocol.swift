//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Ignasi Perez-Valls on 7/11/23.
//

import Foundation

protocol SignupModelValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool
        
    func isLastNameValid(lastName: String) -> Bool
    
    func isEmailValid(email: String) -> Bool
    
    func isPasswordValid(password: String) -> Bool
    
    func doPasswordsMatch(password: String, repeatPassWord: String) -> Bool
    
}
