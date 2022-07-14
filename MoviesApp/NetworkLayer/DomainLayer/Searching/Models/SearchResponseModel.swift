//
//  GetBasicTokenResponseModel.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation

import Foundation

// MARK: - Welcome
public struct SearchResponseModel: BaseResponseProtocol {
    public var error: BaseErrorResponse?
    let page: Int
    let results: [SearchResult]
    let totalPages, totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
public struct SearchResult: Codable {
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int
    let mediaType: MediaType
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let voteAverage: Double?
    let firstAirDate: String?
    let name: String?
    let originCountry: [String]?
    let knownFor: [SearchResult]?
    let knownForDepartment: String?
    let profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case mediaType = "media_type"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
        case firstAirDate = "first_air_date"
        case name
        case originCountry = "origin_country"
        case knownFor = "known_for"
        case knownForDepartment = "known_for_department"
        case profilePath = "profile_path"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
    case person = "person"
    case tv = "tv"
}
