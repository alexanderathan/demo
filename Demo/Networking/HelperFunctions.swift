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
    try! TNCall(route: APIRouter.register(email: email, password: password)).start(onSuccess: onSuccess, onFailure: { error, data in
        ErrorHandler.handleErrors(error: error, data: data)
        onFailure(error, data)
    })
}

// MARK: - Login Helper Function
func loginHelper(id: String, onSuccess: @escaping TNSuccessCallback<Data>, onFailure: @escaping TNFailureCallback) {
    try! TNCall(route: APIRouter.login(id: id)).start(onSuccess: onSuccess, onFailure: { error, data in
        ErrorHandler.handleErrors(error: error, data: data)
        onFailure(error, data)
    })
}
