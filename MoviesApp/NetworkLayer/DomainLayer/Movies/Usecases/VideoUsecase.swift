//
//  VideoUsecase.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 18.07.2022.
//

import Foundation
import RxSwift

public class VideoUsecase: SingleUseCase<VideoRequestModel, VideoResponseModel, MoviesRepositoryInterface> {
    
    
    override func generateUseCase(parameter: VideoRequestModel, pathParameter: String?) -> Single<VideoResponseModel>? {
        return repository.getVideo(params: parameter, movieId: pathParameter!)
    }
}
