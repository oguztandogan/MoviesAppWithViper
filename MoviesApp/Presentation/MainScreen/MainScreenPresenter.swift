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
    
    func getPopularMovies() {
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
    
    func getSearchResults(searchText: String?) {
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
    func eraseTableViewData() {
        formatter.eraseData()
    }
    
    
    func viewDidLoad() {
        getPopularMovies()
    }
    
    func getHeaderTitle(section: Int) -> String? {
        formatter.getHeaderTitle(section: section)
    }
    
    func isSearchEnabled() -> Bool {
        return isSearchingEnabled
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

    func isLoadingCell(for index: Int) -> Bool {
        return index >= formatter.getNumberOfItems(isSearchingEnabled: isSearchingEnabled, section: 0) ?? 0
    }

    func refreshCollectionView() {
//        self.refreshData()
    }
    
    func numberOfSections() -> Int {
        return formatter.getNumberOfSections(isSearchingEnabled: isSearchingEnabled)
    }
    
    func askData(index: Int, section: Int) -> GenericDataProtocol? {
        return formatter.getData(at: index, section: section, isSearchingEnabled: isSearchingEnabled)
    }
    func getLottieAnimationComponentData() -> LottieAnimationComponentData {
        return formatter.getLottieAnimationComponentData()
    }
}


extension MainScreenPresenter: SearchBarComponentDelegate {

    
    func getSearchBarText(searchText: String) {
        getSearchResults(searchText: searchText)
    }
    
    func textBeginEditing(didSearchBarTapped: Bool) {
        isSearchingEnabled = true
//        listDataState?(.searching)
//        eraseTableViewData()
    }
    
    func textFinishedEditing() {
        //isSearchingEnabled = false
        isSearchingEnabled = true
    }
    
    func cancelButtonClicked() {
        listDataState?(.searching)
        eraseTableViewData()
        isSearchingEnabled = false
        return getPopularMovies()
    }
}
