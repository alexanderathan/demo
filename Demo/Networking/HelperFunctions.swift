//
//  HelperFunctions.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 28/8/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import Foundation
import TermiNetwork

// MARK: - Register Helper Function
func registerHelper(email: String, password: String, onSuccess: @escaping TNSuccessCallback<RegisterResponse>, onFailure: @escaping TNFailureCallback) {
    TNRouter.start(APIRouter.register(email: email, password: password), responseType: RegisterResponse.self, onSuccess: onSuccess) { (error, data) in
        onFailure(error, data)
    }
}

// MARK: - Login Helper Function
func loginHelper(id: String, onSuccess: @escaping TNSuccessCallback<LoginResponse>, onFailure: @escaping TNFailureCallback) {
    TNRouter.start(APIRouter.login(id: id), responseType: LoginResponse.self, onSuccess: onSuccess) { (error, data) in
        onFailure(error, data)
    }
}
