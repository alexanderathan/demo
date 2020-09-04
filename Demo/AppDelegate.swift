//
//  AppDelegate.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 28/8/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import UIKit
import TermiNetwork
import IQKeyboardManager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // MARK: - Networking Environment Settings
        //Networking path choice, here you could easily switch to a dev server or localhost
        TNEnvironment.set(Environment.production)
        //Comment this if you do not want networking/parsing details
        TNEnvironment.verbose = true
    
        // MARK: - Keyboard
        IQKeyboardManager.shared().isEnabled = true
        return true
    }

}
