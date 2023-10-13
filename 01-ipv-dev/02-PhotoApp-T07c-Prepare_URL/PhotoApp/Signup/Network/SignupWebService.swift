//
//  SignupWebService.swift
//  PhotoApp
//
//  Created by Ignasi Perez-Valls on 3/10/23.
//

import Foundation

class SignupWebService {
    private let urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    //  func signup(withForm: SignupFormRequestModel) {
    //
    //  }
    
    func signup(
        withForm: SignupFormRequestModel,
        completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void
    ) {
        guard let url = URL(string: urlString) else {
            #warning("TODO: ipv - Create a unit test to test that a specific error message is returned if URL is nil")
            return
        }
    } // signup(withForm:completionHandler)
    
} // SignupWebService
