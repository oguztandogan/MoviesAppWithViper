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
    private var listDataState: ListLoadingStateBlock?

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
        popularMoviesCallback.commonResult(completion: datalistener)
        interactor.fetchPopularMovies(callback: popularMoviesCallback)
    }
    
    
    private func listenerHandler(with result: Result<PopularMoviesResponseModel, BaseErrorResponse>) {
                
        switch result {
        case .failure(let error):
            print("error : \(error)")
        case .success(let response):
            formatter.setData(moviesList: response.results)
            listDataState?(.done)
            //listDataState?(externalRefresh)
        }
    }
    
    private lazy var datalistener: (Result<PopularMoviesResponseModel, BaseErrorResponse>) -> Void = { [weak self] result in
        self?.listenerHandler(with: result)
    }

}

// MARK: - Extensions -

extension MainScreenPresenter: MainScreenPresenterInterface {
    
    func viewDidLoad() {
        getPopularMovies()
    }
    
    func fetchRowData(index: Int) -> PopularMovieViewComponentData {
        formatter.getData(at: index)!
    }
    
    func listenTableViewData(completion: @escaping ListLoadingStateBlock) {
        listDataState = completion
    }
}

extension MainScreenPresenter: PopularMoviesListComponentDelegate {
    
    
    func getItemCount(in section: Int) -> Int {
        return formatter.getNumberOfItems()
    }

    func getData(at index: Int) -> GenericDataProtocol? {
        return formatter.getData(at: index)
    }

    func isLoadingCell(for index: Int) -> Bool {
        return index >= formatter.getNumberOfItems()
    }

    func refreshCollectionView() {
//        self.refreshData()
    }

}
