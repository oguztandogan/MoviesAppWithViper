//
//  PersonDetailsInterfaces.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

enum PersonDetailsNavigationOptions {
    case movieDetails(String?)
}

protocol PersonDetailsWireframeInterface: WireframeInterface {
    func navigate(option: PersonDetailsNavigationOptions)
}

protocol PersonDetailsViewInterface: ViewInterface {
}

protocol PersonDetailsPresenterInterface: PresenterInterface {
    func viewDidLoad()
    func getPersonDetailsComponentData() -> PersonDetailsViewComponentData
    func listenPersonDetailsDataState(completion: @escaping PersonDetailsDataBlock)
    func getHeaderTitle() -> String?
    func listenTableViewData(completion: @escaping ListLoadingStateBlock)
    func getItemCount(section: Int) -> Int
    func getData(at index: Int) -> GenericDataProtocol?
    func navigateToMovieDetailsScreen(index: Int)
}

protocol PersonDetailsFormatterInterface: FormatterInterface {
    func setPersonDetailsData(personDetails: PersonDetailsResponseModel)
    func getPersonDetailsComponentData() -> PersonDetailsViewComponentData
    func getMovieCreditsData(index: Int) -> CellViewComponentData?
    func getNumberOfItems() -> Int?
    func getHeaderTitleData() -> String
    func getSelectedMovieId(index: Int) -> String?
    func setMovieCreditsData(movieCredits: [MovieCredits])
}

protocol PersonDetailsInteractorInterface: InteractorInterface {
    func fetchPersonDetails(callback: PersonDetailsCallback, params: PersonDetailsRequestModel, personId: String)
    func fetchMovieCredits(callback: MovieCreditsCallback, params: MovieCreditsRequestModel, personId: String)
}
