//
//  NumberFormatter.swift
//  TestsDoublesSample
//
//  Created by Matheus de Vasconcelos on 25/09/19.
//  Copyright © 2019 Matheus de Vasconcelos. All rights reserved.
//

import Foundation
class NumberFormatter: Formatter {
    func canFormat(text: String) -> Bool {
        if text.replacingOccurrences(of: "-", with: "").count >= 9 {
            return false
        }

        return true
    }

    func format(text: String) -> String {
        let textWithoutFormmat = text.replacingOccurrences(of: "-", with: "")
        if textWithoutFormmat.count < 8 {
            return textWithoutFormmat
        }
        var numberFormatted = String()
        for (i, character) in textWithoutFormmat.enumerated() {
            numberFormatted.append(character)
            if i == 3 && textWithoutFormmat.count == 8 || i == 4 && textWithoutFormmat.count == 9{
                numberFormatted.append("-")
            }
        }

        return numberFormatted
    }
}
