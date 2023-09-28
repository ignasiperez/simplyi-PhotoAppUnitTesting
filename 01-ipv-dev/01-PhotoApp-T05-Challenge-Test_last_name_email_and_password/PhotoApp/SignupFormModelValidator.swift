//
//  SignFormModelValidator().swift
//  PhotoApp
//
//  Created by Ignasi Perez-Valls on 10/9/23.
//

import Foundation

class SignupFormModelValidator {
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.count < K.SignupConstants.firstNameMinLength ||
            firstName.count > K.SignupConstants.firstNameMaxLenght  {
            returnValue = false
        }
        
        return returnValue
    } // isFirstNameValid(firstName:)
    
    func isLastNameValid(lastName: String) -> Bool {
        var returnValue = true
        
//      if lastName.isEmpty {
//          returnValue = false
//      }
        
//      if lastName.count < K.SignupConstants.lastNameMinLength   {
//            returnValue = false
//      }
        
        if lastName.count < K.SignupConstants.lastNameMinLength ||
            lastName.count > K.SignupConstants.lastNameMaxLenght  {
            returnValue = false
        }
        
        return returnValue
    } // isFirstNameValid(firstName:)
    
    func isEmailValid(email: String) -> Bool {
        var returnValue = true
        
        if email.isEmpty {
            returnValue = false
        }
        
        return returnValue
    } // isEmailValid(email:)
    
    func isPasswordValid(password: String) -> Bool {
        var returnValue = true
        
//      if password.isEmpty {
//          returnValue = false
//      }
        
//      if password.count < K.SignupConstants.passwordMinLenght {
//          returnValue = false
//      }
        
        if password.count < K.SignupConstants.passwordMinLenght ||
            password.count > K.SignupConstants.passwordMaxLenght {
            returnValue = false
        }
        
        return returnValue
    } // isPasswordValid(password:)
    
} // SignFormModelValidator
