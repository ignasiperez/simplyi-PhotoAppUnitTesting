//
//  SignupErrors.swift
//  PhotoApp
//
//  Created by Ignasi Perez-Valls on 4/10/23.
//

import Foundation

//enum SignupError: Error, Equatable {
enum SignupError: LocalizedError, Equatable {
    case responseModelParsingError
    case invalidRequestURLStringError
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .responseModelParsingError, .invalidRequestURLStringError:
            return ""
        }
    }
}
