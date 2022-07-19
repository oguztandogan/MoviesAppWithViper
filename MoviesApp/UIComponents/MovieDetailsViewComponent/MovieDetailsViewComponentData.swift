//
//  MovieDetailsViewComponentData.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 17.07.2022.
//

import Foundation
import UIKit

class MovieDetailsViewComponentData: GenericDataProtocol {
    
    var imageViewData: String?
    var movieTitle: String?
    var summary: String?
    var rating: String?
    
    init(imageViewData: String?,
         movieTitle:String?,
         summary: String?,
         rating: String?) {
        
        self.imageViewData = imageViewData
        self.movieTitle = movieTitle
        self.summary = summary
        self.rating = rating
    }
}
