//
//  SignupErrors.swift
//  PhotoApp
//
//  Created by Ignasi Perez-Valls on 4/10/23.
//

import Foundation

enum SignupError: Error {
    case responseModelParsingError
    case invalidRequestURLStringError
}
