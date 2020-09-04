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
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didReceiveLoginData(_:)),
                                               name: .didReceiveLoginData, object: nil)
        tableView.delegate = self
        tableView.dataSource = self
        let profileCellNib = UINib(nibName: Constants.profileCellNibName, bundle: nil)
        tableView.register(profileCellNib, forCellReuseIdentifier: Constants.profileCellNibName)
        let logoutCellNib = UINib(nibName: Constants.logoutCellNibName, bundle: nil)
        tableView.register(logoutCellNib, forCellReuseIdentifier: Constants.logoutCellNibName)
        tableView.estimatedRowHeight = 150.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.groupTableViewBackground
        registerView = RegisterButtonView(frame: tableView.frame)
        registerView?.delegate = self
        let isLoggedIn = keychain.getBool(Constants.keychainIsLoggedIn) ?? false
        if isLoggedIn {
            guard let userID = keychain.get(Constants.keychainUserID) else {
                // Possible issue with the id in the keychain. Have to loggout user
                keychain.set(false, forKey: Constants.keychainIsLoggedIn)
                keychain.delete(Constants.keychainToken)
                keychain.delete(Constants.keychainUserID)
                return

            }
            login(userID: userID, shouldShowSuccessMessage: false)
        } else {
            tableView.backgroundView = registerView
        }
    }

    // MARK: - Function to handle notification with user info ID
    @objc func didReceiveLoginData(_ notification: NSNotification) {
        guard let userID = notification.userInfo?[Constants.notificationUserInfoKeyID] as? String else { return }
        login(userID: userID, shouldShowSuccessMessage: true)
    }

    // MARK: - Login function
    func login(userID: String, shouldShowSuccessMessage: Bool) {
        loginHelper(userID: userID, onSuccess: { response in
            self.keychain.set(true, forKey: Constants.keychainIsLoggedIn)
            self.keychain.set(userID, forKey: Constants.keychainUserID)
            let profileViewModel = UserProfileViewModel(model: response)
            self.userProfile = profileViewModel
            self.tableView.backgroundView = UIView()
            if shouldShowSuccessMessage {
                self.showMessage(title: Constants.messageTitleSuccess, text: Constants.messageBodySuccess)
            }
        }, onFailure: {error, _ in
            print(error.localizedDescription ?? Constants.undefinedError)
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
            guard let userProfileCell = tableView.dequeueReusableCell(withIdentifier: Constants.profileCellNibName)
                as? UserInfoTableViewCell else {
                return UITableViewCell()
            }
            userProfile?.configure(cell: userProfileCell)
            return userProfileCell
        case 1:
            guard let logoutCell = tableView.dequeueReusableCell(withIdentifier: Constants.logoutCellNibName)
                as? LogoutTableViewCell else {
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
        let alert = UIAlertController(title: Constants.alertLogoutTitle,
                                      message: Constants.alertLogoutMessage, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: Constants.alertLogoutDefaultActionTitle,
                                      style: .default,
                                      handler: { _ in
            self.userProfile = nil
            self.keychain.set(false, forKey: Constants.keychainIsLoggedIn)
            self.keychain.delete(Constants.keychainToken)
            self.keychain.delete(Constants.keychainUserID)
            self.tableView.reloadData()
            self.tableView.backgroundView = self.registerView
        }))
        alert.addAction(UIAlertAction(title: Constants.alertLogoutCancelActionTitle, style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}

extension ProfileViewController: RegisterButtonViewDelegate {
    func didPressRegisterButton() {
        let storyBoard = UIStoryboard(name: Constants.storyboardNameMain, bundle: nil)
        guard let registerViewController =
            storyBoard.instantiateViewController(withIdentifier: Constants.registerViewControllerNibIdentifier)
                as? RegisterViewController else { return }
        if #available(iOS 13, *) {
            present(registerViewController, animated: true, completion: nil)
        } else {
            presentAsStork(registerViewController)
        }
    }

}
