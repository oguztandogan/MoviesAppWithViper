//
//  BaseUseCaseInterface.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation

protocol  BaseUseCaseInterface {
    
    associatedtype Parameters
    associatedtype Responses
    
    func generateUseCase(parameter: Parameters) -> Responses?
}
