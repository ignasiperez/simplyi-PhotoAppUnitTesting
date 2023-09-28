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
        
//      if firstName.count < 2 ||
//          firstName.count > 10  {
//          returnValue = false
//      }
        
        if firstName.count < K.SignupConstants.firstNameMinLength ||
            firstName.count > K.SignupConstants.firstNameMaxLenght  {
            returnValue = false
        }
        
        return returnValue
    } // isFirstNameValid(firstName:)
    
} // SignFormModelValidator
