//
//  FormValidation.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 2/9/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import Foundation
import UIKit

protocol ValidatorConvertible {
    func validated(_ value: String) throws -> String
}

enum ValidatorType {
    case email
    case password
}

enum ValidatorFactory {
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
        switch type {
        case .email: return EmailValidator()
        case .password: return PasswordValidator()
        }
    }
}

class ValidationError: Error {
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
}

struct EmailValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        guard !value.isEmpty else { throw ValidationError(Constants.FORM_VALIDATION_ERROR_EMAIL_REQUIRED) }
        do {
            if try NSRegularExpression(pattern: Constants.FORM_VALIDATION_EMAIL_REGEX, options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError(Constants.FORM_VALIDATION_ERROR_EMAIL_INVALID)
            }
        } catch {
            throw ValidationError(Constants.FORM_VALIDATION_ERROR_EMAIL_INVALID)
        }
        return value
    }
}

struct PasswordValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        guard !value.isEmpty else {throw ValidationError(Constants.FORM_VALIDATION_ERROR_PASSWORD_REQUIRED)}
//        guard value.count >= 6 else { throw ValidationError("Password must have at least 6 characters") }
//        do {
//            if try NSRegularExpression(pattern: "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$",  options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
//                throw ValidationError("Password must be more than 6 characters, with at least one character and one numeric character")
//            }
//        } catch {
//            throw ValidationError("Password must be more than 6 characters, with at least one character and one numeric character")
//        }
        return value
    }
}
