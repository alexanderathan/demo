//
//  ErrorHandler.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 30/8/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import Foundation
import TermiNetwork

class ErrorHandler {
    // MARK: - Response error handler
    //Function providing with abstraction in order to handle 400+ and 500+ http response errors
    static func handleErrors(error: TNError, data: Data?) -> String? {
        switch error {
        case .notSuccess(let statusCode):
            debugPrint(statusCode)
            do {
                guard let errorModel: ResponseError = try data?.deserializeJSONData() else {
                    print(Constants.errorUnableToDeserialize)
                    return Constants.errorUnableToDeserialize
                }
                let errorText = errorModel.error ?? Constants.errorUnableToDeserialize
                return errorText
            } catch {
                print(Constants.errorUnableToDeserialize)
                return Constants.errorUnableToDeserialize
            }
        case .networkError(let error):
            let networkErrorString = [Constants.networkError, error.localizedDescription].joined(separator: " ")
            debugPrint(networkErrorString)
            return networkErrorString
        case .cancelled(let error):
            let cancelledErrorString = [Constants.requestCanceled, error.localizedDescription].joined(separator: " ")
            debugPrint(cancelledErrorString)
            return cancelledErrorString
        case .cannotDeserialize(let error):
            let cannotDeserializeErrorString =
                [Constants.deserializationError, error.localizedDescription].joined(separator: " ")
            debugPrint(cannotDeserializeErrorString)
            return cannotDeserializeErrorString
        default:
            return ""
        }
    }
}
