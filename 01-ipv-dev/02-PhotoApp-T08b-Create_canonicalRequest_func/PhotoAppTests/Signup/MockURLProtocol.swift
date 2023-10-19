//
//  MockURLProtocol.swift
//  PhotoAppTests
//
//  Created by Ignasi Perez-Valls on 18/10/23.
//

import Foundation

class MockURLProtocol: URLProtocol {
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
} // MockURLProtocol
