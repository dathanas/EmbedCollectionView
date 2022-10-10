//
//  ColoredCollectionViewCell.swift
//  EmbedCollectionView
//
//  Created by Mobile Team on 16/9/20.
//  Copyright © 2020 Despina. All rights reserved.
//

import UIKit

class ColoredCollectionViewCell: UICollectionViewCell {
    @IBOutlet
    var coloredView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        coloredView.layer.cornerRadius = 8.0
        coloredView.layer.borderWidth = 0.1
        coloredView.layer.borderColor = UIColor.lightGray.cgColor

        coloredView.layer.shadowColor = UIColor.lightGray.cgColor
        coloredView.layer.shadowRadius = 8.0
        coloredView.layer.shadowOpacity = 0.6
    }
}
