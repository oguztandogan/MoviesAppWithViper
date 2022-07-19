//
//  MovieCastResponseModel.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 18.07.2022.
//

import Foundation

// MARK: - Welcome
public struct MovieCastResponseModel: BaseResponseProtocol {
    public var error: BaseErrorResponse?
    
    public let id: Int?
    public let cast: [Cast]
}

// MARK: - Cast
public struct Cast: Codable {
    public let id: Int?
    public let name: String?
    public let popularity: Double?
    public let profilePath: String?
    public let castID: Int?
    public let character: String?
    public let creditID: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case popularity
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
    }
}
