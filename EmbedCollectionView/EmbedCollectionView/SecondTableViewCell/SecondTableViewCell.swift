//
//  SecondTableViewCell.swift
//  EmbedCollectionView
//
//  Created by Mobile Team on 17/9/20.
//  Copyright © 2020 Despina. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    @IBOutlet
    var colorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //colorView.backgroundColor = UIColor.red
        
        colorView.layer.cornerRadius = 8.0
        colorView.layer.borderWidth = 0.1
        colorView.layer.borderColor = UIColor.lightGray.cgColor

        colorView.layer.shadowColor = UIColor.lightGray.cgColor
        colorView.layer.shadowRadius = 8.0
        colorView.layer.shadowOpacity = 0.6
    }
}


