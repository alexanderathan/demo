//
//  APIRouter.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 28/8/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import TermiNetwork

enum APIRouter: TNRouterProtocol {
    
    case register(email: String, password: String)
    case login(id: String)
    
    func configure() -> TNRouteConfiguration {
        
        let configuration = TNRequestConfiguration(requestBodyType: .JSON)
        
        switch self {
        // MARK: - Register route
        case .register(let email, let password):
            return TNRouteConfiguration(method: .post, path: path("register"), params: ["email" : email, "password" : password], headers: nil, requestConfiguration: configuration)
        // MARK: - Login route
        case .login(id: let id):
            return TNRouteConfiguration(method: .get, path: path("login"), params: ["id" : id], headers: nil, requestConfiguration: configuration)
        }
        
    }
    
}
