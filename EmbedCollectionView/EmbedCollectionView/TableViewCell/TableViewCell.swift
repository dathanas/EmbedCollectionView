//
//  TableViewCell.swift
//  EmbedCollectionView
//
//  Created by Mobile Team on 16/9/20.
//  Copyright © 2020 Despina. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet
    var title: UILabel!
    
    var colorsArray = [UIColor] ()
    
    var selectedColor: UIColor!
    
    var cellDelegate: TableViewCellDelegate? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.delegate = self
        
        self.collectionView.dataSource = self
        
        colorsArray = [UIColor.red, UIColor.green, UIColor.blue, UIColor.yellow, UIColor.purple, UIColor.orange, UIColor.cyan, UIColor.systemPink]
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? ColoredCollectionViewCell {
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let coloredCell = cell as? ColoredCollectionViewCell {
            coloredCell.alpha = 0
            UIView.animate(withDuration: 0.8) {
                coloredCell.alpha = 1
            }
            coloredCell.coloredView.backgroundColor = colorsArray[indexPath.row]
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let size = CGSize(width: 200, height: 120)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedColor = colorsArray[indexPath.row]
        title.text = StringFromUIColor(color: selectedColor)
        title.textColor = selectedColor
        cellDelegate?.sendColor(color: selectedColor)
    }
    
    func StringFromUIColor(color: UIColor) -> String {
        let components = color.cgColor.components
        return "[\(components![0]), \(components![1]), \(components![2]), \(components![3])]"
    }
}
