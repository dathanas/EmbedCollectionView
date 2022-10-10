//
//  ViewController.swift
//  EmbedCollectionView
//
//  Created by Mobile Team on 16/9/20.
//  Copyright © 2020 Despina. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet
    var tableView: UITableView!
    
    var color: UIColor!
    
    var selectedColor: UIColor = .white
    
    var data: [ImageData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "secondTableViewCell")
        tableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "imageTableViewCell")
        
        makeData()
    }
    
    func makeData() {
        for d in ImageCellData.allData {
            data.append(d)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 1 {
            return 1
        } else {
            return data.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "secondTableViewCell", for: indexPath) as? SecondTableViewCell {
                cell.colorView.backgroundColor = selectedColor
                return cell
            }
        } else if indexPath.section == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? TableViewCell {
                color = cell.selectedColor
                cell.cellDelegate = self
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "imageTableViewCell", for: indexPath) as? ImageTableViewCell {
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let imageCell = cell as? ImageTableViewCell {
            imageCell.alpha = 0
            UIView.animate(withDuration: 0.8) {
                imageCell.alpha = 1
            }
            imageCell.willDisplay(data: data[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension ViewController: TableViewCellDelegate {
    func sendColor(color: UIColor) {
        selectedColor = color
        self.tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
}
