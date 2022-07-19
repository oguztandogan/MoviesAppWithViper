//
//  MovieCreditsResponseModel.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 15.07.2022.
//

import Foundation

// MARK: - Welcome
public class MovieCreditsResponseModel: BaseResponseProtocol {
    public let error: BaseErrorResponse?
    public let cast: [MovieCredits]
    public let id: Int?
}

// MARK: - Cast
public struct MovieCredits: Codable {
    public let character: String?
    public let releaseDate: String?
    public let voteCount: Int?
    public let voteAverage: Double?
    public let title: String?
    public let popularity: Double?
    public let id: Int?
    public let backdropPath, overview, posterPath: String?

    enum CodingKeys: String, CodingKey {
        case character
        case releaseDate = "release_date"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case title
        case popularity, id
        case backdropPath = "backdrop_path"
        case overview
        case posterPath = "poster_path"
    }
}

