//
//  ResponseError.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 30/8/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import Foundation

struct ResponseError : Codable {

    let error : String?

    enum CodingKeys: String, CodingKey {
        case error = "error"
    }

}
