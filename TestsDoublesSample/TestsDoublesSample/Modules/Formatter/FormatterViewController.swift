//
//  FormatterViewController.swift
//  TestsDoublesSample
//
//  Created by Matheus de Vasconcelos on 20/09/19.
//  Copyright © 2019 Matheus de Vasconcelos. All rights reserved.
//

import UIKit

public class FormatterViewController: UIViewController {

    var theView: FormatterView!
    let formatter: Formatter

    init(formatter: Formatter) {
        self.formatter = formatter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func loadView() {
        theView = FormatterView(frame: UIScreen.main.bounds)
        theView.delegate = self
        theView.inputTextField.delegate = self
        self.view = theView
    }

}

extension FormatterViewController: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, !formatter.canFormat(text: text), string != "" {
            return false
        }
        return true
    }
}

extension FormatterViewController: FormatterViewDelegate {
    func didFormat(text: String) -> String {
        return formatter.format(text: text)
    }

}
