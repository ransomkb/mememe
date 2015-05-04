//
//  MemeViewController.swift
//  MemeMe
//
//  Created by Ransom Barber on 5/2/15.
//  Copyright (c) 2015 Hart Book. All rights reserved.
//

import Foundation
import UIKit

class MemeViewController: UIViewController {
    
    // Int used for deleting this meme from array in AppDelegate
    var memeNumber: Int!
    var meme: Meme!
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Ensure only appropriate bars are visible.
        self.tabBarController?.tabBar.hidden = true
        self.navigationController!.navigationBarHidden = false
        self.navigationController!.toolbarHidden = false
        
        // Make the memed image accessible
        self.imageView.image = self.meme.memedImage
    }
        
    @IBAction func shareImage(sender: UIBarButtonItem) {
        // Access the ActivityViewController to select method of sharing
        if let image = self.meme.memedImage {
            let shareController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            self.presentViewController(shareController, animated: true, completion: nil)
        }
    }
    
    @IBAction func trashMeme(sender: UIBarButtonItem) {
        // Unwrap the optional.
        if let slot = self.memeNumber {
            // Access the application-wide array of memes and remove it
            let applicationDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
            applicationDelegate.memes.removeAtIndex(self.memeNumber)
            
            // Return to root view controller, either Table or Collection
            let controller = self.navigationController!.viewControllers[0] as! UIViewController
            self.navigationController!.popToRootViewControllerAnimated(true)
        }
    }
}
