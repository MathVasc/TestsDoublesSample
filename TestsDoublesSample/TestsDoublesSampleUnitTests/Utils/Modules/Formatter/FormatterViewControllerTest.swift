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
        }
    }

}
