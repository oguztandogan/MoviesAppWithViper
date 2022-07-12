//
//  MainScreenFormatter.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

final class MainScreenFormatter {
    private var popularMoviesList: PopularMoviesResponseModel!
    private var popularMovie: [PopularMovie] = []
}

// MARK: - Extensions -

extension MainScreenFormatter: MainScreenFormatterInterface {
    func loadMoviesList(moviesList: [PopularMovie]) {
        popularMovie = moviesList
    }
    
    func setData(moviesList: [PopularMovie]) {
        popularMovie = moviesList
    }
        
    func getData(at index: Int) -> PopularMovieViewComponentData? {
        guard index < popularMovie.count else {
            return nil
        }
        let data = popularMovie[index]
        let movieImage = URL(string: data.poster_path ?? "")
        let movieData = PopularMovieViewComponentData(movieImage: movieImage,
                                                      movieTitleText: data.title,
                                                      movieGenreText: "",
                                                      movieRatingText: data.vote_average?.description)
        return movieData
    }
    
    func getRawData(at index: Int) -> PopularMovie {
        return popularMovie[index]
    }
    
    func getNumberOfItems() -> Int {
        return popularMovie.count
    }
}
