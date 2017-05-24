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
    
    var portfolioItem: PortfolioItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navItem.title = portfolioItem?.appName
        
        let layout = AnimatedCollectionViewLayout()
        layout.animator = PageAttributesAnimator()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: collectionView.bounds.width * 0.85, height: collectionView.bounds.height * 0.80)
        collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "screenshotCell", for: indexPath as IndexPath) as? ScreenshotCollectionViewCell
        cell!.imageView.image = portfolioItem.screenshots[indexPath.row]
        return cell!
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
}

class ScreenshotCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
}
