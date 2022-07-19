//
//  GetBasicTokenResponseModel.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation

public struct PersonDetailsResponseModel: BaseResponseProtocol {
    public var error: BaseErrorResponse?
    
    public let id: Int?
    public let name: String?
    public let biography, profilePath: String?

    enum CodingKeys: String, CodingKey {
        case id, name, biography
        case profilePath = "profile_path"
    }
}
