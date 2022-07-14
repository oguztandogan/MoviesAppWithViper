//
//  GetBasicTokenUsecase.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation
import RxSwift

public class MultipleSearchUsecase: SingleUseCase<SearchRequestModel, SearchResponseModel, SearchRepositoryInterface> {
    
    override func generateUseCase(parameter: SearchRequestModel) -> Single<SearchResponseModel>? {
        return repository.getMultipleSearch(params: parameter)

    }
}
