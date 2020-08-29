//
//  Environment.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 28/8/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import TermiNetwork

enum Environment: TNEnvironmentProtocol {
    
    case production
    
    func configure() -> TNEnvironment {
        switch self {
        case .production:
            return TNEnvironment(scheme: .https, host: "reqres.in", suffix: path("api"))
        }
    }
    
}
