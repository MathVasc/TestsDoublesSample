//
//  FormatterViewController.swift
//  TestsDoublesSample
//
//  Created by Matheus de Vasconcelos on 20/09/19.
//  Copyright © 2019 Matheus de Vasconcelos. All rights reserved.
//

import UIKit

public class FormatterViewController: UIViewController {

    override public func loadView() {
        self.view = FormatterView(frame: UIScreen.main.bounds)
    }
}
