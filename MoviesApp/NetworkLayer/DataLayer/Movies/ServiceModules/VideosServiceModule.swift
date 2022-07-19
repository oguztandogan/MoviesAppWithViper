//
//  VideosServiceModule.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 18.07.2022.
//

import Foundation

public class VideosServiceModule: ApiServiceProvider<VideoRequestModel> {
    
    init(request: VideoRequestModel, movieId: String) {
        super.init(method: .get, path: MoviesPaths.videos(movieId).value, pathType: .tmdbBaseUrl, isAuthRequested: false, data: request)
    }
}
