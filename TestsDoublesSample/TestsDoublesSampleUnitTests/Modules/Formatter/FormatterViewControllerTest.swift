//
//  FormatterViewControllerTest.swift
//  TestsDoublesSampleUnitTests
//
//  Created by Matheus de Vasconcelos on 09/10/19.
//  Copyright © 2019 Matheus de Vasconcelos. All rights reserved.
//

import Quick
import Nimble

class FormatterViewControllerTest: QuickSpec {

    override func spec() {
        describe("FormatterViewController") {

            var sut: FormatterViewControllerSpy!

            context("when initialized") {
                beforeEach {
                    sut = FormatterViewControllerSpy(formatter: NumberFormatter())
                    sut.beginAppearanceTransition(true, animated: false)
                    sut.endAppearanceTransition()
                }

                it("should call analytcs when view finish load") {
                    expect(sut.isAnalyticsCalled).to(beTrue())
                }
            }

            context("when initialized with a formatter mock") {

                var formatterCollaborator: NumberFormatterMock!

                beforeEach {
                    formatterCollaborator = NumberFormatterMock()
                    sut = FormatterViewControllerSpy(formatter: formatterCollaborator)
                    sut.beginAppearanceTransition(true, animated: false)
                    sut.endAppearanceTransition()
                }

                context("and delegate call to formatt with a valid number") {

                    var result: Bool!

                    beforeEach {
                        result = false
                        _ = sut.didFormat(text: "12345678")
                        result = formatterCollaborator.verify(methods: .canFormat, .removeFormat, .format, .removeFormat, .canFormat, .removeFormat)
                    }

                    it("should validate and format number") {
                        expect(result).to(beTrue())
                    }
                }

                context("and delegate call to formatt with a not valid number") {

                    var result: Bool!

                    beforeEach {
                        result = false
                        _ = sut.didFormat(text: "1234")
                        result = formatterCollaborator.verify(methods: .canFormat, .removeFormat, .removeFormat)
                    }

                    it("should validate and format number") {
                        expect(result).to(beTrue())
                    }
                }

            }
        }
    }

}
