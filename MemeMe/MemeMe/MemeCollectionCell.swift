//
//  MemeCollectionCell.swift
//  MemeMe
//
//  Created by Ransom Barber on 4/30/15.
//  Copyright (c) 2015 Hart Book. All rights reserved.
//

import UIKit

//Model for storing meme data for a custom collection view cell
class MemeCollectionCell: UICollectionViewCell {
    // Image view property
    @IBOutlet weak var memeImageView: UIImageView!
    
    // Label properties
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
}
