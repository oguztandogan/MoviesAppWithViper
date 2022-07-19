//
//  MovieDetailsViewComponentData.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 17.07.2022.
//

import Foundation
import UIKit

class MovieDetailsViewComponentData: GenericDataProtocol {
    
    var imageViewData: ImageViewComponentData?
    var movieTitle: String?
    var summary: String?
    var rating: String?
    
    init(imageViewData: ImageViewComponentData?,
         movieTitle:String?,
         summary: String?,
         rating: String?) {
        
        self.imageViewData = imageViewData
        self.movieTitle = movieTitle
        self.summary = summary
        self.rating = rating
    }
}
