//
//  LoginData.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 29/8/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import Foundation

struct LoginData : Codable {

    let color : String?
    let id : Int?
    let name : String?
    let pantoneValue : String?
    let year : Int?


    enum CodingKeys: String, CodingKey {
        case color = "color"
        case id = "id"
        case name = "name"
        case pantoneValue = "pantone_value"
        case year = "year"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        color = try values.decodeIfPresent(String.self, forKey: .color)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        pantoneValue = try values.decodeIfPresent(String.self, forKey: .pantoneValue)
        year = try values.decodeIfPresent(Int.self, forKey: .year)
    }

}
