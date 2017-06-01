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
    var selectedPortfolioItem: PortfolioItem? {
        didSet {
            performSegue(withIdentifier: "showPortfolioDetail", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hugItem = PortfolioItem(appName: "HUG", responsibilityDescription: "Now that there is the Tec-9, a crappy spray gun from South Miami. This gun is advertised as the most popular gun in American crime. Do you believe that shit? It actually says that in the little book that comes with it: the most popular gun in American crime. Like they're actually proud of that shit.", logoImage: #imageLiteral(resourceName: "HUG"), linkToAppStore: URL(string: "https://itunes.apple.com/us/app/hug-reading-program/id1228314146?mt=8")!, screenshots: [#imageLiteral(resourceName: "hugHome"), #imageLiteral(resourceName: "hugSlideMenu"), #imageLiteral(resourceName: "hugStudentProgress"), #imageLiteral(resourceName: "hugSchoolDirectory")])
        
        let chirpItem = PortfolioItem(appName: "CHIRP", responsibilityDescription: "Now that there is the Tec-9, a crappy spray gun from South Miami. This gun is advertised as the most popular gun in American crime. Do you believe that shit? It actually says that in the little book that comes with it: the most popular gun in American crime. Like they're actually proud of that shit.", logoImage: #imageLiteral(resourceName: "CHIRP"), linkToAppStore: URL(string: "https://itunes.apple.com/us/app/chirp-radio/id373395037?mt=8")!, screenshots: [#imageLiteral(resourceName: "homeScreen"), #imageLiteral(resourceName: "nowPlaying"), #imageLiteral(resourceName: "recentlyPlayed"), #imageLiteral(resourceName: "favorites")])
        
        portfolioItems.append(hugItem)
        portfolioItems.append(chirpItem)
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PortfolioDetailViewController {
            destination.portfolioItem = selectedPortfolioItem
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "portfolioCell", for: indexPath as IndexPath) as! PortfolioCollectionViewCell
        
        cell.backgroundColor = UIColor.black
        cell.imageView.image = portfolioItems[indexPath.row].logoImage
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPortfolioItem = portfolioItems[indexPath.row]
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
    
    @IBAction func unwindToPortfolio(segue: UIStoryboardSegue) {
    }
}

class PortfolioCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
}
