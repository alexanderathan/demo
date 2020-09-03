//
//  LoginResponse.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 29/8/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import Foundation

struct LoginResponse : Codable {

    let ad : Ad?
    let data : LoginData?

    enum CodingKeys: String, CodingKey {
        case ad
        case data
    }

}
