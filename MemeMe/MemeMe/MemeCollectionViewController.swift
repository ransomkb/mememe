//
//  MemeCollectionViewController.swift
//  MemeMe
//
//  Created by Ransom Barber on 4/30/15.
//  Copyright (c) 2015 Hart Book. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // Model: create an array of memes.
    var memes: [Meme]!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Access the application-wide array of memes
        let applicationDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        self.memes = applicationDelegate.memes
        
        // Make sure table is refreshed whenever it appears as new memes may have been added.
        self.collectionView!.reloadData()
        
        // Segue to Meme Editor if there are no memes for the table yet.
        if self.memes.isEmpty {
            let controller = self.storyboard!.instantiateViewControllerWithIdentifier("MemeEditorViewController") as! MemeEditorViewController
            self.navigationController!.pushViewController(controller, animated: true)
        }
        
        // Ensure only appropriate bars are visible.
        self.navigationController!.navigationBarHidden = false
        self.navigationController!.toolbarHidden = true
        self.tabBarController!.tabBar.hidden = false
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // Dequeue a cell.
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCell", forIndexPath: indexPath) as! MemeCollectionCell
        
        // Get the meme from the array.
        let meme = self.memes[indexPath.row]
        
        // Set the cell elements appropriately.
        cell.topLabel.text = meme.topText
        cell.bottomLabel.text = meme.bottomText
        cell.backgroundView = UIImageView(image: meme.originalImage)
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // Instantiate a view controller to display the meme.
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("MemeViewController") as! MemeViewController
        
        // Set the necessary properties of the next view controller
        detailController.memeNumber = indexPath.row
        detailController.meme = self.memes[indexPath.row]
        
        // Segue to the next view controller
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
}
