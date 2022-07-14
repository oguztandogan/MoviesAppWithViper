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
            return getSearchResultData(index: index, section: section ?? 1)
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
                                              movieGenreText: "",
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
    }
    
    func getHeaderTitle(section: Int) -> String? {
        if let searchResults = combinedSearchResults?[section] {
            if section == 0 && !searchResults.isEmpty {
                return "Movie"
            } else if section == 1 && !searchResults.isEmpty {
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
            let searchImage = URL(string: data.posterPath ?? "")
            let searchData = CellViewComponentData(movieImage: searchImage,
                                                   movieTitleText: data.title,
                                                   movieGenreText: "",
                                                   movieRatingText: data.popularity?.description)
            return searchData
            
        } else {
            let searchImage = URL(string: data.profilePath ?? "")
            let searchData = CellViewComponentData(movieImage: searchImage,
                                                   movieTitleText: data.name,
                                                   movieGenreText: "",
                                                   movieRatingText: data.popularity?.description)
            return searchData
        }
        
    }
    
    func combineSearchResults() -> [[SearchResult]]? {
        
        if !searchedMoviesResults.isEmpty {
            combinedSearchResults?.append(searchedMoviesResults)
            
        }
        if !searchedPeopleResults.isEmpty {
            combinedSearchResults?.append(searchedPeopleResults)
            
        }
        return combinedSearchResults
    }
    
    func getSearchedMoviesData(index: Int) -> CellViewComponentData? {
        guard index < searchedMoviesResults.count else {
            return nil
        }
        let data = searchedMoviesResults[index]
        let movieImage = URL(string: data.posterPath ?? "")
        let movieData = CellViewComponentData(movieImage: movieImage,
                                              movieTitleText: data.title,
                                              movieGenreText: "",
                                              movieRatingText: data.voteAverage?.description)
        return movieData
    }
    
    func getSearchedPeopleData(index: Int) -> CellViewComponentData? {
        guard index < searchedPeopleResults.count else {
            return nil
        }
        let data = searchedPeopleResults[index]
        let personImage = URL(string: data.posterPath ?? "")
        let personData = CellViewComponentData(movieImage: personImage,
                                               movieTitleText: data.name,
                                               movieGenreText: "",
                                               movieRatingText: data.popularity?.description)
        return personData
    }
    
    func getRawData(at index: Int) -> PopularMovie {
        return popularMovie[index]
    }
    
    func getNumberOfItems(isSearchingEnabled: Bool,section: Int) -> Int? {
        return isSearchingEnabled ? combinedSearchResults?[section].count : popularMovie.count
    }
}
