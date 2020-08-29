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
    static func handleErrors(error: TNError, data: Data?) {
        switch error {
        case .notSuccess(let statusCode):
            do {
                guard let errorModel: ResponseError = try data?.deserializeJSONData() else {
                    print("Unable to deserialize error")
                    return
                }
                let errorText = errorModel.error ?? "Attempted to deserialize error but failed"
                print("Error with status code \(String(statusCode))\n\(errorText)")
            } catch {
                print("Unable to identify error")
            }
        case .networkError(let error):
            debugPrint("Network error: " + error.localizedDescription)
            break
        case .cancelled(let error):
            debugPrint("Request canceled with error: " + error.localizedDescription)
            break
        case .cannotDeserialize(_):
            debugPrint("Deserialization: " + error.localizedDescription)
            break
        default: break
        }
    }
}
