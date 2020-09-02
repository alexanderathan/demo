//
//  Extensions.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 2/9/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Notification names
extension Notification.Name {
    static let didReceiveLoginData = Notification.Name(Constants.NOTIFICATION_DID_RECEIVE_LOGIN_DATA)
}

// MARK: - TextField Validation
extension UITextField {
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = ValidatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!)
    }
}
