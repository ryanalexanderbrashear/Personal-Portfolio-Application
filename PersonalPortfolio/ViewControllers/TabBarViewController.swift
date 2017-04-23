//
//  TabBarViewController.swift
//  PersonalPortfolio
//
//  Created by Ryan Brashear on 4/22/17.
//  Copyright © 2017 Ryan Brashear. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for item in tabBar.items! {
            item.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.lightGray], for: .normal)
            item.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.white], for: .selected)
        }
    }
}
