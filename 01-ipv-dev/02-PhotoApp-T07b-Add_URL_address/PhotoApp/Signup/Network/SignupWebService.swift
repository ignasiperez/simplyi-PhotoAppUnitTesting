//
//  SignupWebService.swift
//  PhotoApp
//
//  Created by Ignasi Perez-Valls on 3/10/23.
//

import Foundation

class SignupWebService {
    private let ursString: String
    
    init(urlString: String) {
        self.ursString = urlString
    }
    
//  func signup(withForm: SignupFormRequestModel) {
//        
//  }
    
    func signup(
        withForm: SignupFormRequestModel,
        completionHandler: @escaping (
            SignupResponseModel?, SignupError?
        ) -> Void
    ) {
    
    }
    
}
