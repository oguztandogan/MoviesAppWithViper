//
//  AuthenticationOperationsRemoteInterface.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 14.12.2020.
//

import Foundation
import RxSwift

public protocol MoviesRemoteInterface {
    
    func getPopularMovies(params: PopularMoviesRequestModel) -> Single<PopularMoviesResponseModel>
    func getMovieDetails(params: MovieDetailsRequestModel, movieId: String) -> Single<MovieDetailsResponseModel>
    func getMovieCast(params: MovieCastRequestModel, movieId: String) -> Single<MovieCastResponseModel>
    func getVideo(params: VideoRequestModel, movieId: String) -> Single<VideoResponseModel>
}
