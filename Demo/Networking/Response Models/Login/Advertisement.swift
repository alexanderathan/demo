//
//  Ad.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 29/8/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import Foundation

struct Advertisement: Codable {

    let company: String?
    let text: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case company
        case text
        case url
    }

}
