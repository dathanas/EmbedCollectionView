//
//  ImageCellData.swift
//  EmbedCollectionView
//
//  Created by Mobile Team on 18/9/20.
//  Copyright © 2020 Despina. All rights reserved.
//

import Foundation

struct ImageData {
    var imageUrl : String
    var imageTitle: String
    var imageDescription: String
}

class ImageCellData {
    
    private static var _allData: [ImageData]? = nil

    static var allData : [ImageData] {
        get {
            guard let createdData = _allData else {
                let data = fillData()
                _allData = data

                return data
            }

            return createdData
        }
    }
    
    static func fillData() -> [ImageData] {
        var data: [ImageData] = []
        
        data.append(ImageData.init(imageUrl: "https://media.gettyimages.com/photos/acrylic-colors-and-ink-in-water-abstract-frame-background-isolated-on-picture-id838536664?b=1&k=6&m=838536664&s=612x612&w=0&h=Lvi7KaNbbHSdf_yyhN-_ztcVFnBNnuMioLAuZ7NXmWQ=", imageTitle: "Ink in Water 1", imageDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada nec turpis non efficitur. Proin ut accumsan nulla. Duis vel odio volutpat, tincidunt nulla vel, bibendum dolor. Duis finibus quis metus eget elementum. Curabitur pellentesque elit tristique, tincidunt arcu non, pellentesque lectus. Vivamus tempus ac velit efficitur rutrum. In molestie efficitur augue dapibus luctus."))
        data.append(ImageData.init(imageUrl: "https://s3.envato.com/files/232193067/07-2016-ink-water-3-mm-2.jpg", imageTitle: "Ink in Water 2", imageDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada nec turpis non efficitur. Proin ut accumsan nulla. Duis vel odio volutpat, tincidunt nulla vel, bibendum dolor. Duis finibus quis metus eget elementum. Curabitur pellentesque elit tristique, tincidunt arcu non, pellentesque lectus. Vivamus tempus ac velit efficitur rutrum. In molestie efficitur augue dapibus luctus."))
        data.append(ImageData.init(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSs22kHspT_zFhIPMrD20PNPFqa1jkObZvjtg&usqp=CAU", imageTitle: "Ink in Water 3", imageDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada nec turpis non efficitur. Proin ut accumsan nulla. Duis vel odio volutpat, tincidunt nulla vel, bibendum dolor. Duis finibus quis metus eget elementum. Curabitur pellentesque elit tristique, tincidunt arcu non, pellentesque lectus. Vivamus tempus ac velit efficitur rutrum. In molestie efficitur augue dapibus luctus."))
        
        return data
    }
}
