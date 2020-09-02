//
//  TabBarController.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 28/8/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.items?[0].title = Constants.TAB_BAR_ITEM_FIRST_TITLE
        tabBar.items?[1].title = Constants.TAB_BAR_ITEM_SECOND_TITLE
    }

}
