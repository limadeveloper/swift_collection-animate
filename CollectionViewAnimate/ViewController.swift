//
//  ViewController.swift
//  CollectionViewAnimate
//
//  Created by John Silva on 6/5/15.
//  Copyright (c) 2015 John Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var collection: UICollectionView!
    
    var imagesArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagesArray = ["01.jpg", "02.jpg", "03.jpg", "04.jpg", "05.jpg", "06.jpg", "08.jpg", "09.jpg", "10.jpg", "11.jpg", "12.jpg", "13.jpg", "14.jpg", "15.jpg", "16.jpg", "17.jpg", "18.jpg"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    
    // MARK: 
    // MARK: collection view data source
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! UICollectionViewCell
        
        var imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named: imagesArray[indexPath.row])
        
        var textView = cell.viewWithTag(2) as! UITextView
        textView.scrollEnabled = false
        
        var backButton = cell.viewWithTag(3) as! UIButton
        backButton.hidden = true
        
        return cell
    }
    
    // MARK:
    // MARK: collection view delegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var cell = collectionView.cellForItemAtIndexPath(indexPath)
        
        cell?.superview?.bringSubviewToFront(cell!)
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: nil, animations: ({
            
            cell?.frame = collectionView.bounds
            collectionView.scrollEnabled = false
            
            var textView = cell!.viewWithTag(2) as! UITextView
            textView.scrollEnabled = false
            
            var backButton = cell!.viewWithTag(3) as! UIButton
            backButton.hidden = false
            backButton.addTarget(self, action: "backButtonAction", forControlEvents: UIControlEvents.TouchUpInside)
            
        }), completion: nil)
    }
    
    // MARK:
    // MARK: methods
    func backButtonAction() {
        var indexPath = collection.indexPathsForSelectedItems() as! [NSIndexPath]
        collection.scrollEnabled = true
        collection.reloadItemsAtIndexPaths(indexPath)
    }

}

