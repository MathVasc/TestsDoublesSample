//
//  FormatterView.swift
//  TestsDoublesSample
//
//  Created by Matheus de Vasconcelos on 20/09/19.
//  Copyright © 2019 Matheus de Vasconcelos. All rights reserved.
//

import UIKit

public class FormatterView: UIView, ViewCodable {

    let inputTextField: UITextField
    let formatterButton: UIButton
    weak var delegate: FormatterViewDelegate?

    override init(frame: CGRect) {
        inputTextField = UITextField()
        formatterButton = UIButton()
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func format() {
        if let text = inputTextField.text {
            inputTextField.text = delegate?.didFormat(text: text)
        }
    }

    func configure() {
        formatterButton.addTarget(self, action: #selector(format), for: .touchUpInside)
    }

    func buildHierarchy() {
        addSubview(inputTextField)
        addSubview(formatterButton)
    }

    func buildConstraints() {
        inputTextField.translatesAutoresizingMaskIntoConstraints = false
        formatterButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inputTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            inputTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            inputTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            inputTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            inputTextField.heightAnchor.constraint(equalToConstant: 40),
            formatterButton.topAnchor.constraint(equalTo: inputTextField.bottomAnchor, constant: 16),
            formatterButton.leftAnchor.constraint(equalTo: inputTextField.leftAnchor),
            formatterButton.rightAnchor.constraint(equalTo: inputTextField.rightAnchor),
            formatterButton.heightAnchor.constraint(equalToConstant: 40)
            ])
    }

    func render() {
        inputTextField.font = UIFont.systemFont(ofSize: 40)
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: 39, width: self.frame.width-32, height: 1.0)
        bottomLine.backgroundColor = UIColor.blue.cgColor
        inputTextField.borderStyle = .none
        inputTextField.layer.addSublayer(bottomLine)
        inputTextField.keyboardType = .numberPad
        inputTextField.keyboardAppearance = .dark
        formatterButton.setTitle("Formatar", for: .normal)
        formatterButton.setTitleColor(.blue, for: .normal)
        formatterButton.layer.borderWidth = 1
        formatterButton.layer.borderColor = UIColor.blue.cgColor
        formatterButton.layer.cornerRadius = 20
        formatterButton.clipsToBounds = true
    }
    
}
