//
//  ProfileViewController.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 28/8/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import UIKit
import SPStorkController
import KeychainSwift

class ProfileViewController: UIViewController {
    
    // MARK: - Outlets and Actions
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var userProfile: UserProfileViewModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var registerView: RegisterButtonView?
    let keychain: KeychainSwift = KeychainSwift()
    
    // MARK: - Overriden functions
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveLoginData(_:)), name: .didReceiveLoginData, object: nil)
        tableView.delegate = self
        tableView.dataSource = self
        let profileCellNib = UINib(nibName: Constants.PROFILE_CELL_NIB_NAME, bundle: nil)
        tableView.register(profileCellNib, forCellReuseIdentifier: Constants.PROFILE_CELL_NIB_NAME)
        let logoutCellNib = UINib(nibName: Constants.LOGOUT_CELL_NIB_NAME, bundle: nil)
        tableView.register(logoutCellNib, forCellReuseIdentifier: Constants.LOGOUT_CELL_NIB_NAME)
        tableView.estimatedRowHeight = 150.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.groupTableViewBackground
        registerView = RegisterButtonView(frame: tableView.frame)
        registerView?.delegate = self
        
        let isLoggedIn = keychain.getBool(Constants.KEYCHAIN_IS_LOGGED_IN) ?? false
        if isLoggedIn {
            guard let id = keychain.get(Constants.KEYCHAIN_USER_ID) else {
                // Possible issue with the id in the keychain. Have to loggout user
                keychain.set(false, forKey: Constants.KEYCHAIN_IS_LOGGED_IN)
                keychain.delete(Constants.KEYCHAIN_TOKEN)
                keychain.delete(Constants.KEYCHAIN_USER_ID)
                return
                
            }
            login(userID: id, shouldShowSuccessMessage: false)
        } else {
            tableView.backgroundView = registerView
        }
        
    }
    
    // MARK: - Function to handle notification with user info ID
    @objc func didReceiveLoginData(_ notification: NSNotification) {
        guard let id = notification.userInfo?[Constants.NOTIFICATION_USER_INFO_KEY_ID] as? String else { return }
        login(userID: id, shouldShowSuccessMessage: true)
    }
    
    // MARK: - Login function
    func login(userID: String, shouldShowSuccessMessage: Bool) {
        loginHelper(id: userID, onSuccess: { response in
            self.keychain.set(true, forKey: Constants.KEYCHAIN_IS_LOGGED_IN)
            self.keychain.set(userID, forKey: Constants.KEYCHAIN_USER_ID)
            let profileViewModel = UserProfileViewModel(model: response)
            self.userProfile = profileViewModel
            self.tableView.backgroundView = UIView()
            if shouldShowSuccessMessage {
                self.showMessage(title: Constants.MESSAGE_TITLE_SUCCESS, text: Constants.MESSAGE_BODY_SUCCESS)
            }
        }, onFailure: {error, data in
            print(error.localizedDescription ?? Constants.UNDEFINED_ERROR)
        })
    }

}

// MARK: - TableView Datasource and Delegate extension
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userProfile == nil ? 0 : 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let userProfileCell = tableView.dequeueReusableCell(withIdentifier: Constants.PROFILE_CELL_NIB_NAME) as? UserInfoTableViewCell else {
                return UITableViewCell()
            }
            userProfile?.configure(cell: userProfileCell)
            return userProfileCell
        case 1:
            guard let logoutCell = tableView.dequeueReusableCell(withIdentifier: Constants.LOGOUT_CELL_NIB_NAME) as? LogoutTableViewCell else {
                return UITableViewCell()
            }
            logoutCell.delegate = self
            return logoutCell
        default:
            return UITableViewCell()
        }
    }


}

// MARK: - Cell Logout Extension
extension ProfileViewController: LogoutTableViewCellDelegate {
    func didPressLogoutButton() {
        let alert = UIAlertController(title: Constants.ALERT_LOGOUT_TITLE, message: Constants.ALERT_LOGOUT_MESSAGE, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: Constants.ALERT_LOGOUT_DEFAULT_ACTION_TITLE, style: .default, handler: { action in
            self.userProfile = nil
            self.keychain.set(false, forKey: Constants.KEYCHAIN_IS_LOGGED_IN)
            self.keychain.delete(Constants.KEYCHAIN_TOKEN)
            self.keychain.delete(Constants.KEYCHAIN_USER_ID)
            self.tableView.reloadData()
            self.tableView.backgroundView = self.registerView
        }))
        alert.addAction(UIAlertAction(title: Constants.ALERT_LOGOUT_CANCEL_ACTION_TITLE, style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
}

extension ProfileViewController: RegisterButtonViewDelegate {
    func didPressRegisterButton() {
        let storyBoard = UIStoryboard(name: Constants.STORYBOARD_NAME_MAIN, bundle: nil)
        guard let registerViewController = storyBoard.instantiateViewController(withIdentifier: Constants.REGISTER_VIEW_CONTROLLER_NIB_IDENTIFIER) as? RegisterViewController else { return }
        if #available(iOS 13, *) {
            present(registerViewController, animated: true, completion: nil)
        } else {
            presentAsStork(registerViewController)
        }
    }
    
    
}
