//
//  MockURLProtocol.swift
//  PhotoAppTests
//
//  Created by Ignasi Perez-Valls on 18/10/23.
//

import Foundation

class MockURLProtocol: URLProtocol {
    
    static var stubResponseData: Data?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let signupError = MockURLProtocol.error {
            let errorDescription = (
                signupError as? LocalizedError
            )?.errorDescription ?? ""
            let nsError = NSError(
                domain: "MockURLProtocol",
                code: 1,
                userInfo: [NSLocalizedDescriptionKey: errorDescription]
            )
//            self.client?.urlProtocol(self, didFailWithError: signupError)
            self.client?.urlProtocol(self, didFailWithError: nsError)
        } else {
            self.client?.urlProtocol(
                self,
                didLoad: MockURLProtocol.stubResponseData ?? Data()
            )
        }
        
        self.client?.urlProtocolDidFinishLoading(self)
    } // startLoading()
    
    override func stopLoading() { }
    
} // MockURLProtocol
