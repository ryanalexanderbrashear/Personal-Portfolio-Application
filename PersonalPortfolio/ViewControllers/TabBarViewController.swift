//
//  TabBarViewController.swift
//  PersonalPortfolio
//
//  Created by Ryan Brashear on 4/22/17.
//  Copyright © 2017 Ryan Brashear. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for item in tabBar.items! {
            if let image = item.image {
                item.image = image.imageWithColor(tintColor: UIColor.black).withRenderingMode(.alwaysOriginal)
            }
            let font = UIFont(name: "Arial", size: 12.0)
            item.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.black, NSFontAttributeName: font!], for: .normal)
            item.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.white], for: .selected)
        }
    }
}

extension UIImage {
    func imageWithColor(tintColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        
        let context = UIGraphicsGetCurrentContext()! as CGContext
        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0);
        context.setBlendMode(CGBlendMode.normal)
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        context.clip(to: rect, mask: self.cgImage!)
        tintColor.setFill()
        context.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
