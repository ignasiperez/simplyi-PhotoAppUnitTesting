//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by Ignasi Perez-Valls on 13/11/23.
//

import Foundation

protocol SignupWebServiceProtocol {
    
    func signup(
        withForm formModel: SignupFormRequestModel,
        completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void
    )
    
}
