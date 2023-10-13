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
        withForm formModel: SignupFormRequestModel,
        completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void
    ) {
        guard let url = URL(string: urlString) else {
            #warning("TODO: ipv - Create a unit test to test that a specific error message is returned if URL is nil")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("ContentType", 
                         forHTTPHeaderField: "application-Json")
        request.setValue("Accept", 
                         forHTTPHeaderField: "application_Json")
        
        request.httpBody = try? JSONEncoder().encode(formModel)
        
    } // signup(withForm:completionHandler)
    
} // SignupWebService
