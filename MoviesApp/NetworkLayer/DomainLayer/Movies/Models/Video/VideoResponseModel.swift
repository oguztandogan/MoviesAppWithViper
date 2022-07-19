//
//  VideoResponseModel.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 18.07.2022.
//

import Foundation

// MARK: - Welcome
public struct VideoResponseModel: BaseResponseProtocol {
    public var error: BaseErrorResponse?
    public let id: Int?
    public let results: [VideoResult?]
}

// MARK: - Result
public struct VideoResult: Codable {
    public let name, key: String?
}
