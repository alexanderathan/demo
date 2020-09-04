//
//  Constants.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 30/8/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

class Constants {
    
    // MARK: - Tab bar strings
    static let tabBarItemFirstTitle = "Home"
    static let tabBarItemSecondTitle = "Profile"
    
    // MARK: - Home View Controller Strings
    static let welcomeMessage = "Welcome to my Demo app! Please visit the 'Profile' tab in order to register."
    
    // MARK: - Register View Controller Strings
    static let registerTitle = "Registration"
    static let registerDescription = "Please enter your email and password and then press the 'Register' button below."
    static let usernamePlaceholder = "Username"
    static let passwordPlaceholder = "Password"
    static let registerButtonTitle = "Register"
    static let registerButtonViewNibName = "RegisterButtonView"
    
    // MARK: - Storyboard Files Identifiers
    static let storyboardNameMain = "Main"
    static let registerViewControllerNibIdentifier = "RegisterViewController"
    
    // MARK: - Notification names
    static let notificationDidReceiveLoginData = "didReceiveLoginData"
    static let notificationUserInfoKeyID = "id"
    
    // MARK: - Profile cells
    static let logoutButtonTitle = "Logout"
    static let profilePicturePlaceholder = "ProfilePicturePlaceholder"
    static let profileCellNibName = "UserInfoTableViewCell"
    static let logoutCellNibName = "LogoutTableViewCell"
    
    // MARK: - Keychain keys
    static let keychainIsLoggedIn = "KEYCHAIN_IS_LOGGED_IN"
    static let keychainUserID = "KEYCHAIN_USER_ID"
    static let keychainToken = "KEYCHAIN_TOKEN"
    
    // MARK: - Logout Alert Sheet
    static let alertLogoutTitle = "Are you sure you want to logout?"
    static let alertLogoutMessage = "You will have to enter your credentials again in order to log back in."
    static let alertLogoutDefaultActionTitle = "Yes"
    static let alertLogoutCancelActionTitle = "No"
    
    // MARK: - Error Handler error descriptions
    static let errorUnableToDeserialize = "Unable to deserialize error"
    static let undefinedError = "Undefined error"
    static let networkError = "Network error:"
    static let requestCanceled = "Request canceled with error:"
    static let deserializationError = "Deserialization:"

    // MARK: Network Messages
    static let messageTitleError = "Error"
    static let messageTitleSuccess = "Success"
    static let messageBodySuccess = "You have logged in succesfully!"
    
    // MARK: - Form Validation Messages and regex
    static let formValidationErrorEmailRequired = "Email is required"
    static let formValidationErrorEmailInvalid = "Invalid email Address"
    static let formValidationErrorPasswordRequired = "Password is required"
    static let formValidationEmailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
    
}
