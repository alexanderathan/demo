//
//  RegisterViewController.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 30/8/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import UIKit
import SwiftMessages

class RegisterViewController: UIViewController {

    // MARK: - Outlets and Actions
    @IBOutlet weak var registerTitleLabel: UILabel!
    @IBOutlet weak var registerDescriptionLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        validateAndRegister()
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTitleLabel.text = Constants.REGISTER_TITLE
        registerDescriptionLabel.text = Constants.REGISTER_DESCRIPTION
        usernameTextField.placeholder = Constants.USERNAME_PLACEHOLDER
        passwordTextField.placeholder = Constants.PASSWORD_PLACEHOLDER
        passwordTextField.isSecureTextEntry = true
        registerButton.setTitle(Constants.REGISTER_BUTTON_TITLE, for: .normal)
    }
    
    // MARK: - Register Function
    func register(username: String, password: String) {
        registerButton.isEnabled = false
        activityIndicator.startAnimating()
        registerHelper(email: username, password: password, onSuccess: { response in
            self.registerButton.isEnabled = true
            self.activityIndicator.stopAnimating()
            // Make sure that the id exists before moving further
            guard let _id = response.id else { return }
            // Converting to string
            let idString = String(_id)
            // Posting a notification with the id string in the notification user info. This is received by ProfileViewController.
            NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.NOTIFICATION_DID_RECEIVE_LOGIN_DATA), object: nil, userInfo: [Constants.NOTIFICATION_USER_INFO_KEY_ID: idString])
            self.dismiss(animated: true, completion: nil)
        }, onFailure: { error, data in
            self.registerButton.isEnabled = true
            self.activityIndicator.stopAnimating()
            guard let errorText = ErrorHandler.handleErrors(error: error, data: data) else { return }
            self.showMessage(title: Constants.MESSAGE_TITLE_ERROR, text: errorText)
        })
    }
    
    // MARK: - Validate Text Fields Function
    func validateAndRegister() {
        do {
            //Use the validators to validate the username and password
            let email = try usernameTextField.validatedText(validationType: ValidatorType.email)
            let password = try passwordTextField.validatedText(validationType: ValidatorType.password)
            //Use the validated username and password and attempt to register
            register(username: email, password: password)
        } catch(let error) {
            guard let _error = error as? ValidationError else { return }
            showMessage(title: Constants.MESSAGE_TITLE_ERROR, text: _error.message)
        }
    }

}
