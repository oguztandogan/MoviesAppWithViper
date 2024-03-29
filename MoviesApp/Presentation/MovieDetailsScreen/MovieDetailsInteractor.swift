//
//  MovieDetailsInteractor.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class MovieDetailsInteractor: AssemblerWireframeInteractorProtocol {
    
    private var movieDetailsUsecase: MovieDetailsUsecase?
    private var movieCastUsecase: MovieCastUsecase?
    private var videoUsecase: VideoUsecase?

}

// MARK: - Extensions -

extension MovieDetailsInteractor: MovieDetailsInteractorInterface {
    
    func fetchMovieDetails(callback: MovieDetailsCallback, params: MovieDetailsRequestModel, movieId: String) {
        self.movieDetailsUsecase = self.returnResolver().resolve(MovieDetailsUsecase.self)
        self.movieDetailsUsecase?.execute(useCaseCallBack: callback, params: MovieDetailsRequestModel(), pathParameter: movieId)
    }
    
    func fetchMovieCast(callback: MovieCastCallback, params: MovieCastRequestModel, movieId: String) {
            self.movieCastUsecase = self.returnResolver().resolve(MovieCastUsecase.self)
            self.movieCastUsecase?.execute(useCaseCallBack: callback, params: MovieCastRequestModel(), pathParameter: movieId)
    }
    
    func fetchVideo(callback: VideoCallback, params: VideoRequestModel, movieId: String) {
            self.videoUsecase = self.returnResolver().resolve(VideoUsecase.self)
            self.videoUsecase?.execute(useCaseCallBack: callback, params: VideoRequestModel(), pathParameter: movieId)
    }
}
