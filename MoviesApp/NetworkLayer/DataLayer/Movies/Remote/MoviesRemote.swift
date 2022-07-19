//
//  AuthenticationOperationsRemote.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 14.12.2020.
//

import Foundation
import RxSwift

public class MoviesRemote: MoviesRemoteInterface {

    private let apiManager: HttpClientInterface!
    private let service: MoviesServices!

    public init(apiManager: HttpClientInterface, service: MoviesServices) {
        self.apiManager = apiManager
        self.service = service
    }

    public func getPopularMovies(params: PopularMoviesRequestModel) -> Single<PopularMoviesResponseModel> {
        return apiManager.executeRequest(urlRequestConvertible: service.getPopularMoviesParsedResultServiceModule(params: params))
    }
    
    public func getMovieDetails(params: MovieDetailsRequestModel, movieId: String) -> Single<MovieDetailsResponseModel> {
        return apiManager.executeRequest(urlRequestConvertible: service.getMovieDetailsParsedResultServiceModule(params: params, movieId: movieId))
    }
    
    public func getMovieCast(params: MovieCastRequestModel, movieId: String) -> Single<MovieCastResponseModel> {
        return apiManager.executeRequest(urlRequestConvertible: service.getMovieCastParsedResultServiceModule(params: params, movieId: movieId))
    }

    public func getVideo(params: VideoRequestModel, movieId: String) -> Single<VideoResponseModel> {
        return apiManager.executeRequest(urlRequestConvertible: service.getVideoParsedResultServiceModule(params: params, movieId: movieId))
    }

    deinit {
        print("DEINIT LoginOperationsRemote")
    }
}
