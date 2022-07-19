//
//  MainScreenInterfaces.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

enum MainScreenNavigationOptions {
    case movieDetails(String?)
}

protocol MainScreenWireframeInterface: WireframeInterface {
    func navigate(option: MainScreenNavigationOptions)
}

protocol MainScreenViewInterface: ViewInterface {
}

protocol MainScreenPresenterInterface: PresenterInterface {
    func viewDidLoad()
    func listenTableViewData(completion: @escaping ListLoadingStateBlock)
    func eraseTableViewData()
    func getItemCount(section: Int) -> Int
    func getData(at index: Int, section: Int?) -> GenericDataProtocol?
    func isLoadingCell(for index: Int) -> Bool
    func refreshCollectionView()
    func numberOfSections() -> Int
    func isSearchEnabled() -> Bool
    func getHeaderTitle(section: Int) -> String?
    func getLottieAnimationComponentData() -> LottieAnimationComponentData
    func navigateToMovieDetailsScreen(index: Int)
    
}

protocol MainScreenFormatterInterface: FormatterInterface {
    func setPopularMoviesData(moviesList: [PopularMovie])
    func setSearchResultsData(searchResults: [SearchResult])
    func getRawData(at index: Int) -> PopularMovie
    func getData(at index: Int,section:Int?, isSearchingEnabled: Bool) -> CellViewComponentData?
    func getNumberOfItems(isSearchingEnabled: Bool, section: Int) -> Int?
    func getSearchedMoviesData(index: Int) -> CellViewComponentData?
    func getSearchedPeopleData(index: Int) -> CellViewComponentData?
    func getNumberOfSections(isSearchingEnabled: Bool) -> Int
    func combineSearchResults()
    func eraseData()
    func getHeaderTitle(section: Int) -> String?
    func getLottieAnimationComponentData() -> LottieAnimationComponentData
    func getSelectecMovieId(index: Int) -> String?
}

protocol MainScreenInteractorInterface: InteractorInterface {
    func fetchPopularMovies(callback: MoviesCallback)
    func fetchSearchResults(callback: SearchCallback, params: SearchRequestModel)
}
