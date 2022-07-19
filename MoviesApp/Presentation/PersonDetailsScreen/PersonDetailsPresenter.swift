//
//  PersonDetailsPresenter.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import Foundation

typealias PersonDetailsDataBlock = (PersonDetailsViewComponentData) -> (Void)

final class PersonDetailsPresenter {
    
    // MARK: - Private properties -
    
    private unowned let view: PersonDetailsViewInterface
    private let formatter: PersonDetailsFormatterInterface
    private let interactor: PersonDetailsInteractorInterface
    private let wireframe: PersonDetailsWireframeInterface
    
    private var personDetailsCallback = PersonDetailsCallback()
    private var movieCreditsCallback = MovieCreditsCallback()
    private var collectionState: ListLoadingStateBlock?
    private var personDetailsDataState: PersonDetailsDataBlock?
    private let personId: String?
    private var listDataState: ListLoadingStateBlock?

    
    // MARK: - Lifecycle -
    
    init(
        personId: String?,
        view: PersonDetailsViewInterface,
        formatter: PersonDetailsFormatterInterface,
        interactor: PersonDetailsInteractorInterface,
        wireframe: PersonDetailsWireframeInterface
    ) {
        self.personId = personId
        self.view = view
        self.formatter = formatter
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    private func getPersonDetails() {
        personDetailsCallback.commonResult(completion: personDetailsDatalistener)
        interactor.fetchPersonDetails(callback: personDetailsCallback, params: PersonDetailsRequestModel(), personId: personId ?? "")
    }
    
    private func personDetailsListenerHandler(with result: Result<PersonDetailsResponseModel, BaseErrorResponse>) {
        
        switch result {
        case .failure(let error):
            print("error : \(error)")
        case .success(let response):
            formatter.setPersonDetailsData(personDetails: response)
            personDetailsDataState?(formatter.getPersonDetailsComponentData())
        }
    }
    
    private lazy var personDetailsDatalistener: (Result<PersonDetailsResponseModel, BaseErrorResponse>) -> Void = { [weak self] result in
        self?.personDetailsListenerHandler(with: result)
    }
    
    private func getMovieCredits() {
        movieCreditsCallback.commonResult(completion: movieCreditsDatalistener)
        interactor.fetchMovieCredits(callback: movieCreditsCallback, params: MovieCreditsRequestModel(), personId: personId ?? "")
    }
    
    
    private func movieCreditsListenerHandler(with result: Result<MovieCreditsResponseModel, BaseErrorResponse>) {
                
        switch result {
        case .failure(let error):
            print("error : \(error)")
        case .success(let response):
            formatter.setMovieCreditsData(movieCredits: response.cast)
            listDataState?(.done)
        }
    }
    
    private lazy var movieCreditsDatalistener: (Result<MovieCreditsResponseModel, BaseErrorResponse>) -> Void = { [weak self] result in
        self?.movieCreditsListenerHandler(with: result)
    }
    
}

// MARK: - Extensions -

extension PersonDetailsPresenter: PersonDetailsPresenterInterface {
    
    func viewDidLoad() {
        getPersonDetails()
        getMovieCredits()
    }
    
    func getPersonDetailsComponentData() -> PersonDetailsViewComponentData {
        return formatter.getPersonDetailsComponentData()
    }
    
    func listenPersonDetailsDataState(completion: @escaping PersonDetailsDataBlock) {
        personDetailsDataState = completion
    }
    
    func getHeaderTitle() -> String? {
        formatter.getHeaderTitleData()
    }
    
    func listenTableViewData(completion: @escaping ListLoadingStateBlock) {
        listDataState = completion
    }
    
    func getItemCount(section: Int) -> Int {
        return formatter.getNumberOfItems() ?? 0
    }

    func getData(at index: Int) -> GenericDataProtocol? {
        return formatter.getMovieCreditsData(index: index)
    }
    func navigateToMovieDetailsScreen(index: Int) {
        let movieId = formatter.getSelectedMovieId(index: index)
        wireframe.navigate(option: .movieDetails(movieId))
    }
    
}
