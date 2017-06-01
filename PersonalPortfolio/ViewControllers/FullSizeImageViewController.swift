//
//  FullSizeImageViewController.swift
//  PersonalPortfolio
//
//  Created by Ryan Brashear on 6/1/17.
//  Copyright © 2017 Ryan Brashear. All rights reserved.
//

import UIKit

class FullSizeImageViewController: UIViewController {
    
    @IBOutlet weak var fullSizeImageView: UIImageView!
    
    var image: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isStatusBarHidden = true
        fullSizeImageView.image = image
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        UIApplication.shared.isStatusBarHidden = false
        self.dismiss(animated: true, completion: nil)
    }
}
