//
//  MainScreenPresenter.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import Foundation

typealias ListLoadingStateBlock = (ListLoadingState) -> Void


final class MainScreenPresenter {

    // MARK: - Private properties -

    private unowned let view: MainScreenViewInterface
    private let formatter: MainScreenFormatterInterface
    private let interactor: MainScreenInteractorInterface
    private let wireframe: MainScreenWireframeInterface
    
    private let popularMoviesCallback = MoviesCallback()
    private let searchResultsCallback = SearchCallback()
    private var listDataState: ListLoadingStateBlock?
    private var isSearchingEnabled: Bool = false

    // MARK: - Lifecycle -

    init(
        view: MainScreenViewInterface,
        formatter: MainScreenFormatterInterface,
        interactor: MainScreenInteractorInterface,
        wireframe: MainScreenWireframeInterface
    ) {
        self.view = view
        self.formatter = formatter
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    private func getPopularMovies() {
        popularMoviesCallback.commonResult(completion: popularMoviesDatalistener)
        interactor.fetchPopularMovies(callback: popularMoviesCallback)
    }
    
    
    private func popularMoviesListenerHandler(with result: Result<PopularMoviesResponseModel, BaseErrorResponse>) {
                
        switch result {
        case .failure(let error):
            print("error : \(error)")
        case .success(let response):
            formatter.setPopularMoviesData(moviesList: response.results)
            listDataState?(.done)
        }
    }
    
    private lazy var popularMoviesDatalistener: (Result<PopularMoviesResponseModel, BaseErrorResponse>) -> Void = { [weak self] result in
        self?.popularMoviesListenerHandler(with: result)
    }
    
    private func getSearchResults(searchText: String?) {
        searchResultsCallback.commonResult(completion: searchResultsListenerHandler)
        interactor.fetchSearchResults(callback: searchResultsCallback, params: SearchRequestModel(query: searchText))
    }
    
    private func searchResultsListenerHandler(with result: Result<SearchResponseModel, BaseErrorResponse>) {
                
        switch result {
        case .failure(let error):
            print("error : \(error)")
        case .success(let response):
            formatter.setSearchResultsData(searchResults: response.results)
            formatter.combineSearchResults()
            listDataState?(.done)
        }
    }
    
    private lazy var searchResultsDatalistener: (Result<SearchResponseModel, BaseErrorResponse>) -> Void = { [weak self] result in
        self?.searchResultsListenerHandler(with: result)
    }

}

// MARK: - Extensions -

extension MainScreenPresenter: MainScreenPresenterInterface {

    func viewDidLoad() {
        getPopularMovies()
    }
    
    func eraseTableViewData() {
        formatter.eraseData()
    }
    
    func getHeaderTitle(section: Int) -> String? {
        formatter.getHeaderTitle(section: section)
    }
    
    func listenTableViewData(completion: @escaping ListLoadingStateBlock) {
        listDataState = completion
    }
    
    func getItemCount(section: Int) -> Int {
        return formatter.getNumberOfItems(isSearchingEnabled: isSearchingEnabled, section: section) ?? 0
    }

    func getData(at index: Int, section: Int?) -> GenericDataProtocol? {
        return formatter.getData(at: index, section: section, isSearchingEnabled: isSearchingEnabled)
    }
    
    func numberOfSections() -> Int {
        return formatter.getNumberOfSections(isSearchingEnabled: isSearchingEnabled)
    }
    
    func navigateToMovieDetailsScreen(index: Int) {
        let movieId = formatter.getSelectecMovieId(index: index)
        wireframe.navigate(option: .movieDetails(movieId))
    }
}


extension MainScreenPresenter: SearchBarComponentDelegate {

    

    func getSearchBarText(searchText: String) {
        if searchText == "" {
            isSearchingEnabled = false
            eraseTableViewData()
            listDataState?(.done)
        } else {
            getSearchResults(searchText: searchText)
            isSearchingEnabled = true
            eraseTableViewData()
        }

    }
    
    func cancelButtonClicked() {
        eraseTableViewData()
        isSearchingEnabled = false
        getPopularMovies()
    }

    func textBeginEditing(didSearchBarTapped: Bool, searchText: String?) {
//        isSearchingEnabled = true
//        listDataState?(.searching)
        if searchText == "" {
            eraseTableViewData()
            listDataState?(.done)
        } else {
            
        }
//        eraseTableViewData()
//        listDataState?(.done)
    }

    func textFinishedEditing(searchText: String?) {
        //isSearchingEnabled = false
//        isSearchingEnabled = true
        if searchText == "" {
            eraseTableViewData()
            isSearchingEnabled = false

        }
//        listDataState?(.done)
    }
}


