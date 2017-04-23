//
//  IntroViewController.swift
//  PersonalPortfolio
//
//  Created by Ryan Brashear on 4/22/17.
//  Copyright © 2017 Ryan Brashear. All rights reserved.
//

import UIKit
import Spring

class IntroViewController: UIViewController {
    
    @IBOutlet weak var imageView: SpringImageView!
    @IBOutlet weak var nameLabel: SpringLabel!
    @IBOutlet weak var titleLabel: SpringLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isStatusBarHidden = false
        
        self.imageView.layer.borderWidth = 2
        self.imageView.layer.borderColor = UIColor.white.cgColor
        
        imageView.animation = "slideDown"
        imageView.duration = 2
        imageView.animate()
        
        nameLabel.animation = "slideLeft"
        nameLabel.delay = 1
        nameLabel.duration = 2
        nameLabel.animate()
        
        titleLabel.animation = "slideRight"
        titleLabel.delay = 2
        titleLabel.duration = 2
        titleLabel.animateNext {
            self.imageView.animation = "zoomOut"
            self.imageView.animate()

            self.performSegue(withIdentifier: "goToMainMenu", sender: self)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2
        self.imageView.clipsToBounds = true
    }
}
