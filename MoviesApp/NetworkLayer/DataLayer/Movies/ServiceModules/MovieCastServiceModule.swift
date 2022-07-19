//
//  MovieCastServiceModule.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 18.07.2022.
//

import Foundation

public class MovieCastServiceModule: ApiServiceProvider<MovieCastRequestModel> {
    
    init(request: MovieCastRequestModel, movieId: String) {
        super.init(method: .get, path: MoviesPaths.castList(movieId).value, pathType: .tmdbBaseUrl, isAuthRequested: false, data: request)
    }
}
