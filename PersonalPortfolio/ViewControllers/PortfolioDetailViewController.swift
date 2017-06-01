//
//  PortfolioDetailViewController.swift
//  PersonalPortfolio
//
//  Created by Ryan Brashear on 5/24/17.
//  Copyright © 2017 Ryan Brashear. All rights reserved.
//

import UIKit
import AnimatedCollectionViewLayout

class PortfolioDetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var appStoreButton: UIBarButtonItem!
    
    var portfolioItem: PortfolioItem!
    var appStoreURL: URL!
    var selectedImage: UIImage! {
        didSet {
            self.performSegue(withIdentifier: "showFullSizeImage", sender: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navItem.title = portfolioItem?.appName
        descriptionTextView.text = portfolioItem.responsibilityDescription
        
        let layout = AnimatedCollectionViewLayout()
        layout.animator = PageAttributesAnimator()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.width, height: collectionView.bounds.height * 0.80)
        collectionView.collectionViewLayout = layout
        
        if portfolioItem.linkToAppStore == nil {
            appStoreButton.isEnabled = false
            appStoreButton.tintColor = UIColor.clear
        } else {
            appStoreURL = portfolioItem.linkToAppStore
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        descriptionTextView.setContentOffset(CGPoint.zero, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FullSizeImageViewController {
            destination.image = selectedImage
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "screenshotCell", for: indexPath as IndexPath) as? ScreenshotCollectionViewCell
        cell!.imageView.image = portfolioItem.screenshots[indexPath.row]
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedImage = portfolioItem.screenshots[indexPath.row]
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return portfolioItem.screenshots.count
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindToPortfolio", sender: self)
    }
    
    @IBAction func appStoreButtonTapped(_ sender: Any) {
        UIApplication.shared.open(appStoreURL)
    }
    
    @IBAction func unwindToPortfolioDetail(segue: UIStoryboardSegue) {
    }
}

class ScreenshotCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
}
