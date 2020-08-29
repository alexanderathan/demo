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
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        error = try values.decodeIfPresent(String.self, forKey: .error)
    }

}
