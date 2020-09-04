//
//  Extensions.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 2/9/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import Foundation
import UIKit
import SwiftMessages

// MARK: - Notification names
extension Notification.Name {
    static let didReceiveLoginData = Notification.Name(Constants.notificationDidReceiveLoginData)
}

// MARK: - TextField Validation
extension UITextField {
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = ValidatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!)
    }
}

extension UIViewController {
    func showMessage(title: String, text: String) {
        let messageView: MessageView = MessageView.viewFromNib(layout: .cardView)
        messageView.configureContent(title: title, body: text)
        messageView.button?.isHidden = true
        messageView.iconLabel?.isHidden = true
        messageView.iconImageView?.isHidden = true
        messageView.configureDropShadow()
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .bottom
        config.presentationContext = .viewController(self)
        SwiftMessages.show(config: config, view: messageView)
    }
}
