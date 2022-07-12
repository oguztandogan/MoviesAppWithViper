//
//  MainScreenInteractor.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import Foundation

final class MainScreenInteractor: AssemblerWireframeInteractorProtocol {
    private var popularMoviesUsecase: PopularMoviesUsecase?
}

// MARK: - Extensions -

extension MainScreenInteractor: MainScreenInteractorInterface {
    
    func fetchPopularMovies(callback: MoviesCallback) {
        self.popularMoviesUsecase = self.returnResolver().resolve(PopularMoviesUsecase.self)
        self.popularMoviesUsecase?.execute(useCaseCallBack: callback, params: PopularMoviesRequestModel())
    }
}
