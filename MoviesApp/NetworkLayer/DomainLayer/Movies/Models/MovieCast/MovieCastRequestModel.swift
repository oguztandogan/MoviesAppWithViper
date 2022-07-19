//
//  MovieCastRequestModel.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 18.07.2022.
//

import Foundation

public class MovieCastRequestModel: CodableDataProtocol {
    private(set) var apiKey: String? = Endpoints.ApiKey.apiKey.value

    public init() {
    }
    
}

