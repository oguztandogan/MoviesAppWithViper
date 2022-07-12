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
    func listenTableViewData(completion: @escaping ListLoadingStateBlock)
    
}

protocol MainScreenFormatterInterface: FormatterInterface {
    func setData(moviesList: [PopularMovie])
    func getRawData(at index: Int) -> PopularMovie
    func getData(at index: Int) -> PopularMovieViewComponentData?
    func getNumberOfItems() -> Int
    
}

protocol MainScreenInteractorInterface: InteractorInterface {
    func fetchPopularMovies(callback: MoviesCallback)
    
}
