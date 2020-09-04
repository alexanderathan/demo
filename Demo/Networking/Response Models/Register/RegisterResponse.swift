//
//  RegisterResponse.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 29/8/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import Foundation

struct RegisterResponse: Codable {

    let userID: Int?
    let token: String?

    enum CodingKeys: String, CodingKey {
        case userID = "id"
        case token
    }

}
