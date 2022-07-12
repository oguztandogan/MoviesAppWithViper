//
//  PopularMoviesComponentData.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

class PopularMovieViewComponentData: GenericDataProtocol {
    
    private(set) var movieImage: URL?
    private(set) var movieTitleText: String?
    private(set) var movieGenreText: String?
    private(set) var movieRatingText: String?
    
    init(movieImage: URL?,
         movieTitleText: String?,
         movieGenreText: String?,
         movieRatingText: String?) {
        
        self.movieImage = movieImage
        self.movieTitleText = movieTitleText
        self.movieGenreText = movieGenreText
        self.movieRatingText = movieRatingText
    }
}
