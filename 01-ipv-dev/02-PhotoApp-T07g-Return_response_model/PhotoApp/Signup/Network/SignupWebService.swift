//
//  SignupWebService.swift
//  PhotoApp
//
//  Created by Ignasi Perez-Valls on 3/10/23.
//

import Foundation

class SignupWebService {
    private var urlSession: URLSession
    private var urlString: String
    
//  init(urlString: String) {
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
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
                         forHTTPHeaderField: "application-json")
        request.setValue("Accept",
                         forHTTPHeaderField: "application_json")
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = urlSession.dataTask(with: request)
        { data, response, error in
            #warning("TODO: ipv - Create unit test to handle an error")
            
            if let data,
               let signupResponseModel = try? JSONDecoder().decode(
                SignupResponseModel.self, from: data
               ) {
                completionHandler(signupResponseModel, nil)
            } else {
                #warning("TODO: ipv - Create unit test to handle an error")
            }
        }
        
        dataTask.resume()
        
    } // signup(withForm:completionHandler)
    
} // SignupWebService
