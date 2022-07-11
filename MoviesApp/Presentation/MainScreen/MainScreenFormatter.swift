//
//  MainScreenFormatter.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

final class MainScreenFormatter {
    private var popularMoviesList: [PopularMovie] = []
}

// MARK: - Extensions -

extension MainScreenFormatter: MainScreenFormatterInterface {
    func loadMoviesList(moviesList: [PopularMovie]) {
        popularMoviesList = moviesList
    }
    
    func returnMovieData(index: Int) -> PopularMovieViewComponentData {
        let movieImage = URL(string: popularMoviesList[index].poster_path ?? "")
        let movieData = PopularMovieViewComponentData(movieImage: movieImage,
                                                      movieTitleText: popularMoviesList[index].title,
                                                      movieGenreText: "",
                                                      movieRatingText: popularMoviesList[index].vote_average?.description)
        return movieData
    }
}
