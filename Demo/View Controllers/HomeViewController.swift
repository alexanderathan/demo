//
//  HomeViewController.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 28/8/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var welcomeMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeMessageLabel.text = Constants.welcomeMessage
    }

}
