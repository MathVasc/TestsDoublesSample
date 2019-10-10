//
//  URLSessionStub.swift
//  TestsDoublesSampleUnitTests
//
//  Created by Matheus de Vasconcelos on 09/10/19.
//  Copyright © 2019 Matheus de Vasconcelos. All rights reserved.
//

import Foundation
@testable import TestsDoublesSample

class URLSessionStub: URLSession {

    var shouldError: Bool = false
    var dataResponse: Data = Data()
    var urlResponse: HTTPURLResponse = HTTPURLResponse()
    var statusCode: Int = 200
    var error: Error = NSError(domain:"", code:404, userInfo:nil)

    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        if !shouldError {
            urlResponse = HTTPURLResponse(url: url, statusCode: statusCode, httpVersion: nil, headerFields: nil)!
            completionHandler(dataResponse, urlResponse , nil)
            return URLSessionDataTaskFake()
        }
        completionHandler(nil, nil , error)
        return URLSessionDataTaskFake()
    }
}

class URLSessionDataTaskFake: URLSessionDataTask {

    override func resume() { }
    
}
