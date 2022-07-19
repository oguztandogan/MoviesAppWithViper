//
//  MovieDetailsFormatter.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

final class MovieDetailsFormatter {
    private var movieDetailsModel: MovieDetailsResponseModel?
    private var movieCastModel: [Cast?] = []
    private var videoModel: [VideoResult?]?
}

// MARK: - Extensions -

extension MovieDetailsFormatter: MovieDetailsFormatterInterface {
    
    func setMovieDetailsData(movieDetails: MovieDetailsResponseModel) {
        movieDetailsModel = movieDetails
    }
    func setMovieCastData(movieCast: [Cast?]) {
        movieCastModel = movieCast
    }
    
    func setVideoData(videoData: [VideoResult?]) {
        videoModel = videoData
    }
    
    func getMovieDetailsComponentData() -> MovieDetailsViewComponentData {
        let movieDetailsViewComponentData = MovieDetailsViewComponentData(imageViewData: movieDetailsModel?.backdropPath,
                                                                          movieTitle: movieDetailsModel?.title,
                                                                          summary: movieDetailsModel?.overview,
                                                                          rating: movieDetailsModel?.voteAverage?.description)
        return movieDetailsViewComponentData
    }
    
    func getNumberOfCast() -> Int {
        return movieCastModel.count
    }
    
    func getCastData(index: Int) -> CollectionViewCellViewComponentData? {
        guard index < movieCastModel.count else {
            return nil
        }
        let data = movieCastModel[index]
        return CollectionViewCellViewComponentData(roundedImageData: data?.profilePath,
                                                   titleText: data?.name)
    }
    func getVideoComponentData() -> VideoComponentData {
        guard let videoResult = videoModel,
              !videoResult.isEmpty else {
            return VideoComponentData(videoName: "Couldn't find the video", videoKey: "")
        }
        let videoComponentData = VideoComponentData(videoName: videoResult[0]?.name, videoKey: videoResult[0]?.key)
        return videoComponentData
    }
    
    func getPersonName(index: Int) -> String? {
        return movieCastModel[index]?.id?.description
    }
}
