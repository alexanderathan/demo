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
                    print(Constants.ERROR_UNABLE_TO_DESERIALIZE)
                    return Constants.ERROR_UNABLE_TO_DESERIALIZE
                }
                let errorText = errorModel.error ?? Constants.ERROR_UNABLE_TO_DESERIALIZE
                return errorText
            } catch {
                print(Constants.ERROR_UNABLE_TO_DESERIALIZE)
                return Constants.ERROR_UNABLE_TO_DESERIALIZE
            }
        case .networkError(let error):
            let networkErrorString = [Constants.NETWORK_ERROR, error.localizedDescription].joined(separator: " ")
            debugPrint(networkErrorString)
            return networkErrorString
        case .cancelled(let error):
            let cancelledErrorString = [Constants.REQUEST_CANCELED, error.localizedDescription].joined(separator: " ")
            debugPrint(cancelledErrorString)
            return cancelledErrorString
        case .cannotDeserialize(_):
            let cannotDeserializeErrorString = [Constants.DESERIALIZATION_ERROR, error.localizedDescription].joined(separator: " ")
            debugPrint(cannotDeserializeErrorString)
            return cannotDeserializeErrorString
        default:
            return ""
        }
    }
}
