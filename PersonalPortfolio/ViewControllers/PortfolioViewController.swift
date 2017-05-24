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
    
    var portfolioItems: [PortfolioItem] = []
    var selectedPortfolioItem: PortfolioItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hugItem = PortfolioItem(appName: "HUG", responsibilityDescription: "Test", logoImage: #imageLiteral(resourceName: "HUG"), linkToAppStore: URL(string: "https://itunes.apple.com/us/app/hug-reading-program/id1228314146?mt=8")!)
        
        let chirpItem = PortfolioItem(appName: "CHIRP", responsibilityDescription: "Test", logoImage: #imageLiteral(resourceName: "CHIRP"), linkToAppStore: URL(string: "https://itunes.apple.com/us/app/hug-reading-program/id1228314146?mt=8")!)
        
        let kuncItem = PortfolioItem(appName: "KUNC", responsibilityDescription: "Test", logoImage: #imageLiteral(resourceName: "KUNC"), linkToAppStore: URL(string: "https://itunes.apple.com/us/app/hug-reading-program/id1228314146?mt=8")!)
        
        portfolioItems.append(hugItem)
        portfolioItems.append(chirpItem)
        portfolioItems.append(kuncItem)
        
        pageControl.pageIndicatorTintColor = UIColor(hex: "6ABBEA")
        pageControl.isUserInteractionEnabled = false
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.numberOfPages = portfolioItems.count
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
        cell.imageView.image = portfolioItems[indexPath.row].logoImage
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPortfolioItem = portfolioItems[indexPath.row]
        //performSegue(withIdentifier: "showPortfolioDetail", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return portfolioItems.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PortfolioDetailViewController {
            destination.portfolioItem = selectedPortfolioItem
        }
    }
}

class PortfolioCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
}
