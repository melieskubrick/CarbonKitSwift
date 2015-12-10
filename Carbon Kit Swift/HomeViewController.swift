//
//  HomeViewController.swift
//  Carbon Kit Swift
//
//  Created by Melies Kubrick on 10/12/15.
//  Copyright (c) 2015 Melies Kubrick. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, CarbonTabSwipeNavigationDelegate {

    var items = NSArray()
    var carbonTabSwipeNavigation: CarbonTabSwipeNavigation = CarbonTabSwipeNavigation()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "CarbonKit"
        items = [UIImage(named: "home")!, UIImage(named: "hourglass")!, UIImage(named: "premium_badge")!, "Categories", "Top Free", "Top New Free", "Top Paid", "Top New Paid"]
        carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items as [AnyObject], delegate: self)
        carbonTabSwipeNavigation.insertIntoRootViewController(self)
        self.style()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func style() {
        var color: UIColor = UIColor(red: 24.0 / 255, green: 75.0 / 255, blue: 152.0 / 255, alpha: 1)
        self.navigationController!.navigationBar.translucent = false
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController!.navigationBar.barTintColor = color
        self.navigationController!.navigationBar.barStyle = .BlackTranslucent
        carbonTabSwipeNavigation.toolbar.translucent = false
        carbonTabSwipeNavigation.setIndicatorColor(color)
        carbonTabSwipeNavigation.setTabExtraWidth(30)
        carbonTabSwipeNavigation.carbonSegmentedControl.setWidth(80, forSegmentAtIndex: 0)
        carbonTabSwipeNavigation.carbonSegmentedControl.setWidth(80, forSegmentAtIndex: 1)
        carbonTabSwipeNavigation.carbonSegmentedControl.setWidth(80, forSegmentAtIndex: 2)
        
        carbonTabSwipeNavigation.setNormalColor(UIColor.blackColor().colorWithAlphaComponent(0.6))
        carbonTabSwipeNavigation.setSelectedColor(color, font: UIFont.boldSystemFontOfSize(14))

    }
    
    func carbonTabSwipeNavigation(carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAtIndex index: UInt) -> UIViewController {
        
        switch index {
        case 0:
            return self.storyboard!.instantiateViewControllerWithIdentifier("ViewControllerOne")! as! ViewControllerOne
        case 1:
            return self.storyboard!.instantiateViewControllerWithIdentifier("ViewControllerTwo")! as! ViewControllerTwo
        default:
            return self.storyboard!.instantiateViewControllerWithIdentifier("ViewControllerThree")! as! ViewControllerThree
        }
        
    }
    
    func carbonTabSwipeNavigation(carbonTabSwipeNavigation: CarbonTabSwipeNavigation, didMoveAtIndex index: UInt) {
        NSLog("Did move at index: %ld", index)
    }
    
}
