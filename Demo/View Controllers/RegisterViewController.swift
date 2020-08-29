//
//  RegisterViewController.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 30/8/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    // MARK: - Outlets and Actions
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        guard let _username = usernameTextField.text,
            let _password = passwordTextField.text else { return }
        register(username: _username, password: _password)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.placeholder = Constants.USERNAME_PLACEHOLDER
        passwordTextField.placeholder = Constants.PASSWORD_PLACEHOLDER
        registerButton.setTitle(Constants.REGISTER_BUTTON_TITLE, for: .normal)
    }
    
    // MARK: - Register Function
    func register(username: String, password: String) {
        registerHelper(email: username, password: password, onSuccess: { response in
            print(response)
        }, onFailure: { error, data in
            print(error.localizedDescription ?? "Undefined error")
        })
    }

}
