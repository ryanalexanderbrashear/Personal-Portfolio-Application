//
//  ContactViewController.swift
//  PersonalPortfolio
//
//  Created by Ryan Brashear on 4/23/17.
//  Copyright © 2017 Ryan Brashear. All rights reserved.
//

import UIKit
import Spring
import Font_Awesome_Swift

class ContactViewController: UIViewController {

    @IBOutlet weak var profileImageView: SpringImageView!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var gitHubButton: UIButton!
    @IBOutlet weak var websiteButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var linkedInButton: UIButton!
    @IBOutlet weak var gitLabButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        gitHubButton.setFAIcon(icon: .FAGithub, iconSize: 45.0, forState: .normal)
        setupButton(button: gitHubButton)
        
        gitLabButton.setFAIcon(icon: .FAGitlab, iconSize: 45.0, forState: .normal)
        setupButton(button: gitLabButton)
        
        callButton.setFAIcon(icon: .FAPhone, iconSize: 45.0, forState: .normal)
        setupButton(button: callButton)
        
        emailButton.setFAIcon(icon: .FAEnvelopeO, iconSize: 45.0, forState: .normal)
        setupButton(button: emailButton)
        
        websiteButton.setFAIcon(icon: .FAChrome, iconSize: 45.0, forState: .normal)
        setupButton(button: websiteButton)
        
        linkedInButton.setFAIcon(icon: .FALinkedin, iconSize: 45.0, forState: .normal)
        setupButton(button: linkedInButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.isStatusBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        profileImageView.image = #imageLiteral(resourceName: "ryanBrashearColor")
        profileImageView.animation = "zoomIn"
        profileImageView.duration = 1.0
        profileImageView.damping = 1.0
        profileImageView.animate()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        profileImageView.image = nil
        UIApplication.shared.isStatusBarHidden = false
    }
    
    func setupButton(button: UIButton) {
        button.setFATitleColor(color: UIColor.white)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
    }
    
    @IBAction func callButtonTapped(_ sender: Any) {
        let number = URL(string: "telprompt://" + "16062160399")!
        UIApplication.shared.open(number)
    }
    
    @IBAction func gitHubButtonTapped(_ sender: Any) {
        let url = URL(string: "https://github.com/ryanbrashear")!
        UIApplication.shared.open(url)
    }
    
    @IBAction func websiteButtonTapped(_ sender: Any) {
        let url = URL(string: "http://www.ryanbrashear.com")!
        UIApplication.shared.open(url)
    }
    
    @IBAction func emailButtonTapped(_ sender: Any) {
        let email = "alexbrashear@gmail.com"
        if let url = URL(string: "mailto:\(email)") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func linkedInButtonTapped(_ sender: Any) {
        let url = URL(string: "https://www.linkedin.com/in/ryanbrashear/")!
        UIApplication.shared.open(url)
    }
    
    @IBAction func gitLabButtonTapped(_ sender: Any) {
        let url = URL(string: "https://gitlab.com/ryanbrashear")!
        UIApplication.shared.open(url)
    }
    
}
