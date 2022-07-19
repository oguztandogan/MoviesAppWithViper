//
//  PersonDetailsFormatter.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

final class PersonDetailsFormatter {
    private var personDetailsModel: PersonDetailsResponseModel?
    private var movieCreditsModel: [MovieCredits] = []
}

// MARK: - Extensions -

extension PersonDetailsFormatter: PersonDetailsFormatterInterface {
    
    func setPersonDetailsData(personDetails: PersonDetailsResponseModel) {
        personDetailsModel = personDetails
    }
    
    func setMovieCreditsData(movieCredits: [MovieCredits]) {
        movieCreditsModel = movieCredits
    }
    
    
    func getPersonDetailsComponentData() -> PersonDetailsViewComponentData {
        let personDetailsViewComponentData = PersonDetailsViewComponentData(profilePictureUrl: personDetailsModel?.profilePath,
                                                                            personName: personDetailsModel?.name,
                                                                            biographyText: personDetailsModel?.biography)
        return personDetailsViewComponentData
    }
    

    func getNumberOfItems() -> Int? {
        return movieCreditsModel.count
    }
    
    func getMovieCreditsData(index: Int) -> CellViewComponentData? {
        guard index < movieCreditsModel.count else {
            return nil
        }
        let data = movieCreditsModel[index]
        let movieImage = URL(string: data.posterPath ?? "")
        return CellViewComponentData(movieImage: movieImage,
                                     movieTitleText: movieCreditsModel[index].title,
                                     movieRatingText: movieCreditsModel[index].voteAverage?.description)
    }
    
    func getHeaderTitleData() -> String {
        return "Movie Credits"
    }
    
    func getSelectedMovieId(index: Int) -> String? {
        return movieCreditsModel[index].id?.description
    }
}
