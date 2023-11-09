//
//  SignupFormRequestMoel.swift
//  PhotoApp
//
//  Created by Ignasi Perez-Valls on 4/10/23.
//

import Foundation

struct SignupFormRequestModel: Codable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
