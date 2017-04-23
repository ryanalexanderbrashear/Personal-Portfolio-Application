//
//  PortfolioViewController.swift
//  PersonalPortfolio
//
//  Created by Ryan Brashear on 4/23/17.
//  Copyright © 2017 Ryan Brashear. All rights reserved.
//

import UIKit

class PortfolioViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: view.frame.width * 0.1, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width * 0.8, height: view.frame.height * 0.8)
        layout.minimumLineSpacing = view.frame.width * 0.1
        collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "portfolioCell", for: indexPath as IndexPath)
        
        cell.backgroundColor = UIColor.black
        
        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
}
