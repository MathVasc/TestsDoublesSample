//
//  NumberFormatterMock.swift
//  TestsDoublesSampleUnitTests
//
//  Created by Matheus de Vasconcelos on 09/10/19.
//  Copyright © 2019 Matheus de Vasconcelos. All rights reserved.
//

import Foundation
@testable import TestsDoublesSample

class NumberFormatterMock: NumberFormatter {

    var methodsCalled: [NumberFormatterMethods] = []

    override func canFormat(text: String) -> Bool {
        methodsCalled.append(.canFormat)
        return super.canFormat(text: text)
    }

    override func format(text: String) -> String {
        methodsCalled.append(.format)
        return super.format(text: text)
    }

    override func removeFormat(text: String) -> String {
        methodsCalled.append(.removeFormat)
        return super.removeFormat(text: text)
    }

    func verify(methods: NumberFormatterMethods...) -> Bool {
        if methods.count != methodsCalled.count {
            methodsCalled = []
            return false
        }

        let isValid = methods.elementsEqual(methodsCalled)
        methodsCalled = []
        return isValid
    }

}

enum NumberFormatterMethods {
    case canFormat, format, removeFormat
}
