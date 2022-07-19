//
//  KnownForCollectionViewCellComponentData.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 15.07.2022.
//

import Foundation

class CollectionViewCellViewComponentData: GenericDataProtocol {
    
    private(set) var roundedImageData: String?
    private(set) var titleText: String?
    
    init(roundedImageData: String?,
         titleText: String?) {
        
        self.roundedImageData = roundedImageData
        self.titleText = titleText
    }
}
