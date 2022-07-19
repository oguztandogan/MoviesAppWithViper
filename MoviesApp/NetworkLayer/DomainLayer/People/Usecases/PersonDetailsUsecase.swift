//
//  GetBasicTokenUsecase.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation
import RxSwift

public class PersonDetailsUsecase: SingleUseCase<PersonDetailsRequestModel, PersonDetailsResponseModel, PeopleRepositoryInterface> {
    
    override func generateUseCase(parameter: PersonDetailsRequestModel, pathParameter: String?) -> Single<PersonDetailsResponseModel>? {
        return repository.getPersonDetails(params: parameter, personId: pathParameter ?? "")
    }
}
