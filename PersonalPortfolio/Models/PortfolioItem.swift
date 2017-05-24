//
//  PortfolioItem.swift
//  PersonalPortfolio
//
//  Created by Ryan Brashear on 5/12/17.
//  Copyright © 2017 Ryan Brashear. All rights reserved.
//

import Foundation

class PortfolioItem {
    var appName: String
    var datesWorkedOn: String
    var responsibilityDescription: String
    var linkToAppStore: String?
    
    init(appName: String, datesWorkedOn: String, responsibilityDescription: String, linkToAppStore: String) {
        self.appName = appName
        self.datesWorkedOn = datesWorkedOn
        self.responsibilityDescription = responsibilityDescription
        self.linkToAppStore = linkToAppStore
    }
    
    init(appName: String, datesWorkedOn: String, responsibilityDescription: String) {
        self.appName = appName
        self.datesWorkedOn = datesWorkedOn
        self.responsibilityDescription = responsibilityDescription
    }
}
