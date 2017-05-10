//
//  PortfolioViewController.swift
//  PersonalPortfolio
//
//  Created by Ryan Brashear on 4/23/17.
//  Copyright © 2017 Ryan Brashear. All rights reserved.
//

import UIKit
import AnimatedCollectionViewLayout

class PortfolioViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var totalCollectionViewCells = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.pageIndicatorTintColor = UIColor(hex: "6ABBEA")
        pageControl.isUserInteractionEnabled = false
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.numberOfPages = totalCollectionViewCells
        pageControl.currentPage = 1
        
        let layout = AnimatedCollectionViewLayout()
        layout.animator = RotateInOutAttributesAnimator()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height * 0.85)
        collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "portfolioCell", for: indexPath as IndexPath) as! PortfolioCollectionViewCell
        
        cell.backgroundColor = UIColor.black
        if indexPath.row == 0 {
            cell.imageView.image = #imageLiteral(resourceName: "HUG")
        } else if indexPath.row == 2 {
            cell.imageView.image = #imageLiteral(resourceName: "CHIRP")
        } else {
            cell.imageView.image = #imageLiteral(resourceName: "KUNC")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalCollectionViewCells
    }
}

class PortfolioCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
}
