//
//  APIClientDefaultTest.swift
//  TestsDoublesSampleUnitTests
//
//  Created by Matheus de Vasconcelos on 09/10/19.
//  Copyright © 2019 Matheus de Vasconcelos. All rights reserved.
//

import Quick
import Nimble
@testable import TestsDoublesSample

class APIClientDefaultTest: QuickSpec {

    override func spec() {
        describe("APIClientDefault") {
            var sut: APIClientDefault!

            context("when initialized") {
                var urlSessionCollaborator: URLSessionStub!

                beforeEach {
                    urlSessionCollaborator = URLSessionStub()
                    sut = APIClientDefault(session: urlSessionCollaborator)
                }

                context("and call request that return an error") {
                    var result: Bool!
                    var errorType: NetworkError!

                    beforeEach {
                        let dummyURL = URL(string: "https://test.com")!
                        result = false
                        urlSessionCollaborator.shouldError = true
                        sut.request(dummyURL, completion: { (reqResult) in
                            if case .failure(let error) = reqResult {
                                result = true
                                errorType = error
                            }
                        })
                    }

                    it("should return a failure case") {
                        expect(result).to(beTrue())
                    }

                    it("should return an error of kind request failed") {
                        expect(errorType).to(equal(NetworkError.requestFailed))
                    }

                }

                context("and call request that return data") {

                    context("and the http status code is 200") {
                        var result: Bool!
                        var dataResult: Data?

                        beforeEach {
                            let dummyURL = URL(string: "https://test.com")!
                            result = false
                            urlSessionCollaborator.shouldError = false
                            urlSessionCollaborator.statusCode = 200
                            sut.request(dummyURL, completion: { (reqResult) in
                                if case .success(let data) = reqResult {
                                    result = true
                                    dataResult = data
                                }
                            })
                        }

                        it("should return an data") {
                            expect(dataResult).toNot(beNil())
                        }

                        it("should be succefull in request") {
                            expect(result).to(beTrue())
                        }
                    }

                    context("and the http status code is different from 200") {
                        var errorType: NetworkError!

                        beforeEach {
                            let dummyURL = URL(string: "https://test.com")!
                            urlSessionCollaborator.shouldError = false
                            urlSessionCollaborator.statusCode = 202
                            sut.request(dummyURL, completion: { (reqResult) in
                                if case .failure(let error) = reqResult {
                                    errorType = error
                                }
                            })
                        }

                        it("should return an error of kind request failed") {
                            expect(errorType).to(equal(NetworkError.requestFailed))
                        }
                    }

                }
                
            }
        }
    }

}
