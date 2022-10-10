//
//  ImageTableViewCell.swift
//  EmbedCollectionView
//
//  Created by Mobile Team on 18/9/20.
//  Copyright © 2020 Despina. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var rootView: UIView!
    
    @IBOutlet weak var detailsContainerView: UIView!
    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        rootView.layer.cornerRadius = 8.0
        rootView.layer.borderWidth = 0.1
        rootView.layer.borderColor = UIColor.lightGray.cgColor
        
        mainImage.layer.cornerRadius = 8.0
        detailsContainerView.layer.cornerRadius = 8.0

        rootView.layer.shadowColor = UIColor.lightGray.cgColor
        rootView.layer.shadowRadius = 8.0
        rootView.layer.shadowOpacity = 0.6
    }

    func willDisplay(data: ImageData) {
        setImage(from: data.imageUrl)
        titleLabel.text = data.imageTitle
        descriptionLabel.text = data.imageDescription
    }
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }
        
        let requestId = UUID()
        mainImage.image = UIImage(named: "imageNotAvailable")
        
        // just not to cause a deadlock in UI!
        DispatchQueue.global(qos: .background).async {
            let id = requestId
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            if id == requestId {
                let image = UIImage(data: imageData)
                
                DispatchQueue.main.async {
                    self.mainImage.image = image
                }
            }
        }
    }
}
