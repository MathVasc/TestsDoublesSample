//
//  SingletonDummy.swift
//  TestsDoublesSampleHostedUnitTests
//
//  Created by Matheus de Vasconcelos on 10/10/19.
//  Copyright © 2019 Matheus de Vasconcelos. All rights reserved.
//

import Foundation

class SingletonDummy {

    static let shared: SingletonDummy = SingletonDummy()
    var bool: Bool

    private init () {
        bool = false
    }
}
