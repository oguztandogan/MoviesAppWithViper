//
//  MainScreenPresenter.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import Foundation

final class MainScreenPresenter {

    // MARK: - Private properties -

    private unowned let view: MainScreenViewInterface
    private let formatter: MainScreenFormatterInterface
    private let interactor: MainScreenInteractorInterface
    private let wireframe: MainScreenWireframeInterface

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
    
    private func retrievePopularMoviesList() {
        interactor.getPopularMovies { [weak self] response in
            self?.formatter.loadMoviesList(moviesList: response)
        }
    }
    
    private func handlePopularMoviesResponse() {
        
    }
}

// MARK: - Extensions -

extension MainScreenPresenter: MainScreenPresenterInterface {
    
    func viewDidLoad() {
        retrievePopularMoviesList()
    }
    
    func fetchRowData(index: Int) -> PopularMovieViewComponentData {
        formatter.returnMovieData(index: index)
    }
}
