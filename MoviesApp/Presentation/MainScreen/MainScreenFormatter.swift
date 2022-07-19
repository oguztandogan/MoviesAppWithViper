//
//  MainScreenFormatter.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit
import SwiftUI

final class MainScreenFormatter {
    private var popularMoviesList: PopularMoviesResponseModel!
    private var popularMovie: [PopularMovie] = []
    private var searchingResults: [SearchResult] = []
    private var searchedMoviesResults: [SearchResult] = []
    private var searchedPeopleResults: [SearchResult] = []
    private var combinedSearchResults: [[SearchResult]]? = [[]]
}

// MARK: - Extensions -

extension MainScreenFormatter: MainScreenFormatterInterface {
    
    func setPopularMoviesData(moviesList: [PopularMovie]) {
        popularMovie = moviesList
    }
    
    func setSearchResultsData(searchResults: [SearchResult]) {
        searchingResults = searchResults
        searchedMoviesResults = searchingResults.filter { $0.mediaType.rawValue == "movie"}
        searchedPeopleResults = searchingResults.filter{ $0.mediaType.rawValue == "person"}
    }
    
    func getData(at index: Int, section: Int?, isSearchingEnabled: Bool) -> CellViewComponentData? {
        if !isSearchingEnabled {
            return getPopularMoviesData(index: index)
        } else {
            return getSearchResultData(index: index, section: section ?? 0)
        }
    }
    
    func getPopularMoviesData(index: Int) -> CellViewComponentData? {
        guard index < popularMovie.count else {
            return nil
        }
        let data = popularMovie[index]
        let movieImage = URL(string: data.poster_path ?? "")
        let movieData = CellViewComponentData(movieImage: movieImage,
                                              movieTitleText: data.title,
                                              movieRatingText: data.vote_average?.description)
        return movieData
    }
    
    func getNumberOfSections(isSearchingEnabled: Bool) -> Int {
        return combinedSearchResults?.count == 2 ? 2 : 1
    }
    
    func eraseData() {
        popularMovie.removeAll()
        searchedMoviesResults.removeAll()
        searchedPeopleResults.removeAll()
        combinedSearchResults?.removeAll()
    }
    
    func getHeaderTitle(section: Int) -> String? {
        if let searchResults = combinedSearchResults,
           !searchResults.isEmpty{
            if section == 0 && !searchResults[section].isEmpty {
                return "Movie"
            } else if section == 1 && !searchResults[section].isEmpty {
                return "People"
            }
        }
        return nil

    }
    
    func getSearchResultData(index: Int, section: Int) -> CellViewComponentData? {
        guard let data = combinedSearchResults?[section][index] else {
            return nil
        }
        if section == 0 {
            if data.mediaType.rawValue == "movie" {
            let searchImage = URL(string: data.posterPath ?? "")
            let searchData = CellViewComponentData(movieImage: searchImage,
                                                   movieTitleText: data.title,
                                                   movieRatingText: data.popularity?.description)
            return searchData
            } else {
                let searchImage = URL(string: data.profilePath ?? "")
                let searchData = CellViewComponentData(movieImage: searchImage,
                                                       movieTitleText: data.name,
                                                       movieRatingText: data.popularity?.description)
                return searchData
            }
        } else {
            let searchImage = URL(string: data.profilePath ?? "")
            let searchData = CellViewComponentData(movieImage: searchImage,
                                                   movieTitleText: data.name,
                                                   movieRatingText: data.popularity?.description)
            return searchData
        }
        
    }
    
    
    func combineSearchResults(){
        
        if !searchedMoviesResults.isEmpty {
            combinedSearchResults?.append(searchedMoviesResults)
        }
        if !searchedPeopleResults.isEmpty {
            combinedSearchResults?.append(searchedPeopleResults)
        }
    }
    
    func getNumberOfItems(isSearchingEnabled: Bool,section: Int) -> Int? {
        if let combinedSearchResults = combinedSearchResults,
           isSearchingEnabled && !combinedSearchResults.isEmpty {
            return combinedSearchResults[section].count
        } else {
            return popularMovie.count
        }
    }
    
    func getSelectecMovieId(index: Int) -> String? {
        return popularMovie[index].id?.description
    }
    
}

