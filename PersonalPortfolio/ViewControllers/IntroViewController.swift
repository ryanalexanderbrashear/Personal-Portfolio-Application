//
//  IntroViewController.swift
//  PersonalPortfolio
//
//  Created by Ryan Brashear on 4/22/17.
//  Copyright © 2017 Ryan Brashear. All rights reserved.
//

import UIKit
import Spring
import SwiftSpinner

class IntroViewController: UIViewController {
    
    @IBOutlet weak var imageView: SpringImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isStatusBarHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        SwiftSpinner.show(duration: 4.0, title: "Loading...")
        imageView.image = #imageLiteral(resourceName: "blueback")
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
            self.performSegue(withIdentifier: "goToMainMenu", sender: self)
        }
    }
}
