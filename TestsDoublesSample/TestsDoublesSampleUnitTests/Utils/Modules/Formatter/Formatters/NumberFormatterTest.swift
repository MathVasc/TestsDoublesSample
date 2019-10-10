//
//  NumberFormatterTest.swift
//  TestsDoublesSampleUnitTests
//
//  Created by Matheus de Vasconcelos on 09/10/19.
//  Copyright © 2019 Matheus de Vasconcelos. All rights reserved.
//

import Quick
import Nimble

class NumberFormatterTest: QuickSpec {

    override func spec() {
        describe("NumberFormatter") {
            
            var sut: NumberFormatterMock!

            context("when initialized") {
                beforeEach {
                    sut = NumberFormatterMock()
                }

                context("and asked if can format") {
                    var result: Bool!

                    beforeEach {
                        result = false
                        _ = sut.canFormat(text: "12345678")
                        result = sut.verify(methods: .canFormat, .removeFormat)
                    }

                    it("should call remove format") {
                        expect(result).to(beTrue())
                    }

                }

                context("and asked to format") {
                    var result: Bool!

                    beforeEach {
                        result = false
                        _ = sut.format(text: "12345678")
                        result = sut.verify(methods: .format, .removeFormat, .canFormat, .removeFormat)
                    }

                    it("should call remove format") {
                        expect(result).to(beTrue())
                    }

                }

            }
        }
    }

}
