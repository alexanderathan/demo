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
        validateAndRegister()
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
            // Make sure that the id exists before moving further
            guard let _id = response.id else { return }
            // Converting to string
            let idString = String(_id)
            // Posting a notification with the id string in the notification user info. This is received by ProfileViewController.
            NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.NOTIFICATION_DID_RECEIVE_LOGIN_DATA), object: nil, userInfo: [Constants.NOTIFICATION_USER_INFO_KEY_ID: idString])
            self.dismiss(animated: true, completion: nil)
            //print(response)
        }, onFailure: { error, data in
            print(error.localizedDescription ?? "Undefined error")
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
            print(_error.message)
            // TODO: Show alert with the validation error
            //showAlert(for: (error as! ValidationError).message)
        }
    }
    

}
