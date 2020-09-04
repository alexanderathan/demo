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
        registerTitleLabel.text = Constants.registerTitle
        registerDescriptionLabel.text = Constants.registerDescription
        usernameTextField.placeholder = Constants.usernamePlaceholder
        passwordTextField.placeholder = Constants.passwordPlaceholder
        passwordTextField.isSecureTextEntry = true
        registerButton.setTitle(Constants.registerButtonTitle, for: .normal)
    }

    // MARK: - Register Function
    func register(username: String, password: String) {
        registerButton.isEnabled = false
        activityIndicator.startAnimating()
        registerHelper(email: username, password: password, onSuccess: { response in
            self.registerButton.isEnabled = true
            self.activityIndicator.stopAnimating()
            // Make sure that the id exists before moving further
            guard let userID = response.userID else { return }
            // Converting to string
            let idString = String(userID)
            // Posting a notification with the id string in the notification user info.
            // This is received by ProfileViewController.
            NotificationCenter.default.post(name:
                Notification.Name(rawValue: Constants.notificationDidReceiveLoginData),
                                            object: nil, userInfo: [Constants.notificationUserInfoKeyID: idString])
            self.dismiss(animated: true, completion: nil)
        }, onFailure: { error, data in
            self.registerButton.isEnabled = true
            self.activityIndicator.stopAnimating()
            guard let errorText = ErrorHandler.handleErrors(error: error, data: data) else { return }
            self.showMessage(title: Constants.messageTitleError, text: errorText)
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
        } catch let error {
            guard let error = error as? ValidationError else { return }
            showMessage(title: Constants.messageTitleError, text: error.message)
        }
    }

}
