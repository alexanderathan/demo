//
//  Constants.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 30/8/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

class Constants {
    
    // MARK: - Tab bar strings
    static let TAB_BAR_ITEM_FIRST_TITLE = "Home"
    static let TAB_BAR_ITEM_SECOND_TITLE = "Profile"
    
    // MARK: - Home View Controller Strings
    static let WELCOME_MESSAGE = "Welcome to my Demo app! Please visit the 'Profile' tab in order to register."
    
    // MARK: - Register View Controller Strings
    static let REGISTER_TITLE = "Registration"
    static let REGISTER_DESCRIPTION = "Please enter your email and password and then press the 'Register' button below."
    static let USERNAME_PLACEHOLDER = "Username"
    static let PASSWORD_PLACEHOLDER = "Password"
    static let REGISTER_BUTTON_TITLE = "Register"
    static let REGISTER_BUTTON_VIEW_NIB_NAME = "RegisterButtonView"
    
    // MARK: - Storyboard Files Identifiers
    static let STORYBOARD_NAME_MAIN = "Main"
    static let REGISTER_VIEW_CONTROLLER_NIB_IDENTIFIER = "RegisterViewController"
    
    // MARK: - Notification names
    static let NOTIFICATION_DID_RECEIVE_LOGIN_DATA = "didReceiveLoginData"
    static let NOTIFICATION_USER_INFO_KEY_ID = "id"
    
    // MARK: - Profile cells
    static let LOGOUT_BUTTON_TITLE = "Logout"
    static let PROFILE_PICTURE_PLACEHOLDER = "ProfilePicturePlaceholder"
    static let PROFILE_CELL_NIB_NAME = "UserInfoTableViewCell"
    static let LOGOUT_CELL_NIB_NAME = "LogoutTableViewCell"
    
    // MARK: - Keychain keys
    static let KEYCHAIN_IS_LOGGED_IN = "KEYCHAIN_IS_LOGGED_IN"
    static let KEYCHAIN_USER_ID = "KEYCHAIN_USER_ID"
    static let KEYCHAIN_TOKEN = "KEYCHAIN_TOKEN"
    
    // MARK: - Logout Alert Sheet
    static let ALERT_LOGOUT_TITLE = "Are you sure you want to logout?"
    static let ALERT_LOGOUT_MESSAGE = "You will have to enter your credentials again in order to log back in."
    static let ALERT_LOGOUT_DEFAULT_ACTION_TITLE = "Yes"
    static let ALERT_LOGOUT_CANCEL_ACTION_TITLE = "No"
    
    // MARK: - Error Handler error descriptions
    static let ERROR_UNABLE_TO_DESERIALIZE = "Unable to deserialize error"
    static let UNDEFINED_ERROR = "Undefined error"
    static let NETWORK_ERROR = "Network error:"
    static let REQUEST_CANCELED = "Request canceled with error:"
    static let DESERIALIZATION_ERROR = "Deserialization:"
    
    // MARK: Network Messages
    static let MESSAGE_TITLE_ERROR = "Error"
    static let MESSAGE_TITLE_SUCCESS = "Success"
    static let MESSAGE_BODY_SUCCESS = "You have logged in succesfully!"
    
    // MARK: - Form Validation Messages and regex
    static let FORM_VALIDATION_ERROR_EMAIL_REQUIRED = "Email is required"
    static let FORM_VALIDATION_ERROR_EMAIL_INVALID = "Invalid email Address"
    static let FORM_VALIDATION_ERROR_PASSWORD_REQUIRED = "Password is required"
    static let FORM_VALIDATION_EMAIL_REGEX = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
    
}
