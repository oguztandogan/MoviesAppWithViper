//
//  GenericImageViewComponentData.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 15.07.2022.
//

import Foundation
import UIKit

class ImageViewComponentData: GenericDataProtocol {
    
    var image: UIImage?
    var imageUrl: String?
    var cornerRadius: CGFloat?
    
    init(image: UIImage? = nil, imageUrl: String? = nil, cornerRadius: CGFloat? = 0) {
        
        self.image = image
        self.imageUrl = imageUrl
        self.cornerRadius = cornerRadius
    }
}
