//
//  SingletonDummyTest.swift
//  TestsDoublesSampleHostedUnitTests
//
//  Created by Matheus de Vasconcelos on 10/10/19.
//  Copyright © 2019 Matheus de Vasconcelos. All rights reserved.
//

import Quick
import Nimble

class SingletonDummyTest: QuickSpec {

    override func spec() {
        describe("SingletonDummy") {

            context("when request the bool value") {
                context("when request the bool value after change to true") {
                    beforeEach {
                        SingletonDummy.shared.bool = true
                    }
                    it("should return true as default") {
                        expect(SingletonDummy.shared.bool).to(beTrue())
                    }
                }

                it("should return false as default") {
                    expect(SingletonDummy.shared.bool).to(beFalse())
                }
            }

        }
    }

}
