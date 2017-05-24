//
//  PortfolioItem.swift
//  PersonalPortfolio
//
//  Created by Ryan Brashear on 5/12/17.
//  Copyright © 2017 Ryan Brashear. All rights reserved.
//

import Foundation
import UIKit

class PortfolioItem {
    var appName: String
    var responsibilityDescription: String
    var logoImage: UIImage
    var linkToAppStore: URL?
    var screenshots: [UIImage]
    
    //For apps that are on the app store
    init(appName: String, responsibilityDescription: String, logoImage: UIImage, linkToAppStore: URL, screenshots: [UIImage]) {
        self.appName = appName
        self.responsibilityDescription = responsibilityDescription
        self.logoImage = logoImage
        self.linkToAppStore = linkToAppStore
        self.screenshots = screenshots
    }
    
    //For apps that aren't on the app store
    init(appName: String, responsibilityDescription: String, logoImage: UIImage, screenshots: [UIImage]) {
        self.appName = appName
        self.responsibilityDescription = responsibilityDescription
        self.logoImage = logoImage
        self.screenshots = screenshots
    }
}
