//
//  ViewControllerTwo.swift
//  Carbon Kit Swift
//
//  Created by Melies Kubrick on 10/12/15.
//  Copyright (c) 2015 Melies Kubrick. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var refresh: CarbonSwipeRefresh = CarbonSwipeRefresh()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresh = CarbonSwipeRefresh(scrollView: self.collectionView)
        
        refresh.setMarginTop(0)
        refresh.colors = [UIColor.blueColor(), UIColor.redColor(), UIColor.orangeColor(), UIColor.greenColor()]
        self.view.addSubview(refresh)
        refresh.addTarget(self, action: "refresh:", forControlEvents: .ValueChanged)
        
    }

    override func viewWillLayoutSubviews() {
        var flowLayout: UICollectionViewFlowLayout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - 30) / 2, 145)
    }
    
    func refresh(sender: AnyObject) {
        NSLog("REFRESH")
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(5 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.refresh.endRefreshing()
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! UICollectionViewCell
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var viewT: ViewControllerThree = self.storyboard!.instantiateViewControllerWithIdentifier("ViewControllerThree")! as! ViewControllerThree
        self.navigationController!.pushViewController(viewT, animated: true)
    }
    
}
