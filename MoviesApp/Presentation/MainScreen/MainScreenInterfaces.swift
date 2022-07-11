//
//  MainScreenInterfaces.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

protocol MainScreenWireframeInterface: WireframeInterface {
}

protocol MainScreenViewInterface: ViewInterface {
}

protocol MainScreenPresenterInterface: PresenterInterface {
    func viewDidLoad()
    func fetchRowData(index: Int) -> PopularMovieViewComponentData
}

protocol MainScreenFormatterInterface: FormatterInterface {
    func loadMoviesList(moviesList: [PopularMovie])
    func returnMovieData(index: Int) -> PopularMovieViewComponentData
    
}

protocol MainScreenInteractorInterface: InteractorInterface {
    func getPopularMovies(completion: @escaping ([PopularMovie]) -> Void)
}
