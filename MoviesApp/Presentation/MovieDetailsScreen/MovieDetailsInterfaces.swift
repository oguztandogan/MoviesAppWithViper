//
//  MovieDetailsInterfaces.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

enum MovieDetailsNavigationOptions {
    case personDetails(String?)
}


protocol MovieDetailsWireframeInterface: WireframeInterface {
    func navigate(option: MovieDetailsNavigationOptions)
}

protocol MovieDetailsViewInterface: ViewInterface {
}

protocol MovieDetailsPresenterInterface: PresenterInterface {
    func viewDidLoad()
    func getMovieDetailsComponentData() -> MovieDetailsViewComponentData
    func listenCollectionState(completion: @escaping ListLoadingStateBlock)
    func getItemCount() -> Int
    func getData(index: Int) -> GenericDataProtocol?
    func listenMovieDetailsDataState(completion: @escaping MovieDetailsDataBlock)
    func getVideoComponentData() -> VideoComponentData
    func listenVideoDataState(completion: @escaping VideoDataBlock)
    func didSelectItemAt(index: Int)
}

protocol MovieDetailsFormatterInterface: FormatterInterface {
    func setMovieDetailsData(movieDetails: MovieDetailsResponseModel)
    func setMovieCastData(movieCast: [Cast?])
    func getCastData(index: Int) -> CollectionViewCellViewComponentData?
    func getMovieDetailsComponentData() -> MovieDetailsViewComponentData
    func getNumberOfCast() -> Int
    func getVideoComponentData() -> VideoComponentData
    func setVideoData(videoData: [VideoResult?])
    func getPersonName(index: Int) -> String?
}

protocol MovieDetailsInteractorInterface: InteractorInterface {
    func fetchMovieDetails(callback: MovieDetailsCallback, params: MovieDetailsRequestModel, movieId: String)
    func fetchMovieCast(callback: MovieCastCallback, params: MovieCastRequestModel, movieId: String)
    func fetchVideo(callback: VideoCallback, params: VideoRequestModel, movieId: String)
    

}
