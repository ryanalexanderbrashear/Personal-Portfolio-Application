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
        self.imageView.layer.borderWidth = 2
        self.imageView.layer.borderColor = UIColor.white.cgColor
        
        imageView.animation = "slideDown"
        imageView.duration = 2
        imageView.animate()
        
        nameLabel.animation = "slideDown"
        nameLabel.delay = 1
        nameLabel.duration = 2
        nameLabel.animate()
        
        titleLabel.animation = "slideDown"
        titleLabel.delay = 2
        titleLabel.duration = 2
        titleLabel.animateNext {
            self.imageView.animation = "zoomOut"
            self.imageView.animate()
            self.performSegue(withIdentifier: "goToMainMenu", sender: self)
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2
        self.imageView.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
