//
//  MovieDetailsPresenter.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import Foundation
import RxSwift

typealias MovieDetailsDataBlock = (MovieDetailsViewComponentData) -> Void
typealias VideoDataBlock = (VideoComponentData) -> Void

final class MovieDetailsPresenter {

    // MARK: - Private properties -

    private unowned let view: MovieDetailsViewInterface
    private let formatter: MovieDetailsFormatterInterface
    private let interactor: MovieDetailsInteractorInterface
    private let wireframe: MovieDetailsWireframeInterface
    
    private let movieDetailsCallback = MovieDetailsCallback()
    private let movieCastCallback = MovieCastCallback()
    private let videoCallback = VideoCallback()
    private let disposeBag = DisposeBag()
    private var collectionState: ListLoadingStateBlock?
    private var movieDetailsDataState: MovieDetailsDataBlock?
    private var videoDataState: VideoDataBlock?

    
    private let movieId: String?


    // MARK: - Lifecycle -

    init(
        view: MovieDetailsViewInterface,
        formatter: MovieDetailsFormatterInterface,
        interactor: MovieDetailsInteractorInterface,
        wireframe: MovieDetailsWireframeInterface,
        movieId: String?
    ) {
        self.view = view
        self.formatter = formatter
        self.interactor = interactor
        self.wireframe = wireframe
        self.movieId = movieId
    }
    
    private func getMovieDetails() {
        movieDetailsCallback.commonResult(completion: movieDetailsDatalistener)
        interactor.fetchMovieDetails(callback: movieDetailsCallback, params: MovieDetailsRequestModel(), movieId: movieId ?? "")
    }
    
    private func movieDetailsListenerHandler(with result: Result<MovieDetailsResponseModel, BaseErrorResponse>) {
                
        switch result {
        case .failure(let error):
            print("error : \(error)")
        case .success(let response):
            formatter.setMovieDetailsData(movieDetails: response)
            movieDetailsDataState?(formatter.getMovieDetailsComponentData())
        }
    }
    
    private lazy var movieDetailsDatalistener: (Result<MovieDetailsResponseModel, BaseErrorResponse>) -> Void = { [weak self] result in
        self?.movieDetailsListenerHandler(with: result)
    }

    private func getMovieCast() {
        movieCastCallback.commonResult(completion: movieCastDatalistener)
        interactor.fetchMovieCast(callback: movieCastCallback, params: MovieCastRequestModel(), movieId: movieId ?? "")
    }
    
    private func movieCastListenerHandler(with result: Result<MovieCastResponseModel, BaseErrorResponse>) {
                
        switch result {
        case .failure(let error):
            print("error : \(error)")
        case .success(let response):
            formatter.setMovieCastData(movieCast: response.cast)
            collectionState?(.done)
        }
    }
    
    private lazy var movieCastDatalistener: (Result<MovieCastResponseModel, BaseErrorResponse>) -> Void = { [weak self] result in
        self?.movieCastListenerHandler(with: result)
    }
    
    private func getVideo() {
        videoCallback.commonResult(completion: videoDatalistener)
        interactor.fetchVideo(callback: videoCallback, params: VideoRequestModel(), movieId: movieId ?? "")
    }
    
    private func videoListenerHandler(with result: Result<VideoResponseModel, BaseErrorResponse>) {
        switch result {
        case .failure(let error):
            print("error : \(error)")
        case .success(let response):
            formatter.setVideoData(videoData: response.results)
            videoDataState?(formatter.getVideoComponentData())
        }
    }
    
    private lazy var videoDatalistener: (Result<VideoResponseModel, BaseErrorResponse>) -> Void = { [weak self] result in
        self?.videoListenerHandler(with: result)
    }


}

// MARK: - Extensions -

extension MovieDetailsPresenter: MovieDetailsPresenterInterface {

    func viewDidLoad() {
        getMovieDetails()
        getMovieCast()
        getVideo()
    }
    
    func getMovieDetailsComponentData() -> MovieDetailsViewComponentData {
        return formatter.getMovieDetailsComponentData()
    }
    
    func listenCollectionState(completion: @escaping ListLoadingStateBlock) {
        collectionState = completion
    }
    
    func listenMovieDetailsDataState(completion: @escaping MovieDetailsDataBlock) {
        movieDetailsDataState = completion
    }
    
    func getVideoComponentData() -> VideoComponentData {
        return formatter.getVideoComponentData()
    }
    
    func listenVideoDataState(completion: @escaping VideoDataBlock) {
        videoDataState = completion
    }
    
    func getItemCount() -> Int {
        return formatter.getNumberOfCast()
    }
    
    func getData(index: Int) -> GenericDataProtocol? {
        return formatter.getCastData(index: index)
    }
    
    func didSelectItemAt(index: Int) {
        let personId = formatter.getPersonName(index: index)
        wireframe.navigate(option: .personDetails(personId))
    }

}
