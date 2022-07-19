//
//  AuthenticationOperationsRepository.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 14.12.2020.
//

import Foundation
import RxSwift

public class MoviesRepository: MoviesRepositoryInterface {
    
    private let apiRemote: MoviesRemoteInterface!
    
    public init(apiRemote: MoviesRemoteInterface) {
        self.apiRemote = apiRemote
    }
    
    public func getPopularMovies(params: PopularMoviesRequestModel) -> Single<PopularMoviesResponseModel> {
        return apiRemote.getPopularMovies(params: params)
    }
    
    public func getMovieDetails(params: MovieDetailsRequestModel, movieId: String) -> Single<MovieDetailsResponseModel> {
        return apiRemote.getMovieDetails(params: params, movieId: movieId)
    }
    
    public func getMovieCast(params: MovieCastRequestModel, movieId: String) -> Single<MovieCastResponseModel> {
        return apiRemote.getMovieCast(params: params, movieId: movieId)
    }
    
    public func getVideo(params: VideoRequestModel, movieId: String) -> Single<VideoResponseModel> {
        return apiRemote.getVideo(params: params, movieId: movieId)
    }
}
