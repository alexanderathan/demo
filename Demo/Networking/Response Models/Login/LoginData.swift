//
//  LoginData.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 29/8/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import Foundation

struct LoginData: Codable {

    let avatar: String?
    let email: String?
    let firstName: String?
    let userID: Int?
    let lastName: String?

    enum CodingKeys: String, CodingKey {
        case avatar
        case email
        case firstName = "first_name"
        case userID = "id"
        case lastName = "last_name"
    }

}
