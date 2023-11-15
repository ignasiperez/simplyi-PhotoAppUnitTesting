//
//  MocksignupWebService.swift
//  PhotoAppTests
//
//  Created by Ignasi Perez-Valls on 13/11/23.
//

import Foundation
@testable import PhotoApp

class MockSignupWebService: SignupWebServiceProtocol {
    
    var isSignupMethodCalled: Bool = false
    
    func signup(
        withForm formModel: PhotoApp.SignupFormRequestModel,
        completionHandler: @escaping (PhotoApp.SignupResponseModel?, PhotoApp.SignupError?) -> Void) {
        isSignupMethodCalled = true
    }
    
}
