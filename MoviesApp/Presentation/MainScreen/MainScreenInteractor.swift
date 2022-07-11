//
//  MainScreenInteractor.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import Foundation

final class MainScreenInteractor {
}

// MARK: - Extensions -

extension MainScreenInteractor: MainScreenInteractorInterface {
    
    func getPopularMovies(completion: @escaping ([PopularMovie]) -> Void) {
        let popularMoviesUrl = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=85f6ed635a992836f8ba2fd6fb5fa5cb")
        guard let downloadPopularMoviesUrl = popularMoviesUrl else {return}
        URLSession.shared.dataTask(with: downloadPopularMoviesUrl) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil
                else {
                    return}
            do {
                let decoder = JSONDecoder()
                let popularMoviesList = try decoder.decode(PopularMoviesResponseModel.self, from: data)
                completion(popularMoviesList.results)
            } catch{}
        }.resume()
    }
}
