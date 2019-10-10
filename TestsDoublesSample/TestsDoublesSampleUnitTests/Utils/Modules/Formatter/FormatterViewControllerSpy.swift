//
//  FormatterViewControllerSpy.swift
//  TestsDoublesSampleUnitTests
//
//  Created by Matheus de Vasconcelos on 09/10/19.
//  Copyright © 2019 Matheus de Vasconcelos. All rights reserved.
//

import Foundation
@testable import TestsDoublesSample

class FormatterViewControllerSpy: FormatterViewController {

    var isAnalyticsCalled = false

    override func callAnalytics() {
        isAnalyticsCalled = true
    }
}
