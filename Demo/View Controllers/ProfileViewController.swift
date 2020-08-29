//
//  ProfileViewController.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 28/8/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import UIKit
import SPStorkController

class ProfileViewController: UIViewController {
    
    // MARK: - Outlets and Actions
    @IBOutlet weak var registerButton: UIButton!
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: Constants.STORYBOARD_NAME_MAIN, bundle: nil)
        guard let registerViewController = storyBoard.instantiateViewController(withIdentifier: Constants.REGISTER_VIEW_CONTROLLER_NIB_IDENTIFIER) as? RegisterViewController else { return }
        presentAsStork(registerViewController)
    }
    
    override func loadView() {
        super.loadView()
        registerButton.setTitle(Constants.REGISTER_BUTTON_TITLE, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func login(userID: String) {
        loginHelper(id: userID, onSuccess: { response in
            print(response)
        }, onFailure: {error, data in
            print(error.localizedDescription ?? "Undefined error")
        })
    }

}
