//
//  Endpoints.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation

typealias PathType = Endpoints.PathType
typealias ApiKey = Endpoints.ApiKey
typealias MoviesPaths = Endpoints.MoviesPaths
typealias SearchPaths = Endpoints.SearchPaths
typealias PeoplePaths = Endpoints.PeoplePaths
typealias BaseImageUrl = Endpoints.ImageURL

public enum Endpoints {
    
    public enum PathType: GenericValueProtocol {
        case tmdbBaseUrl
        
        public typealias Value = String
        
        public var value: String {
            switch self {
            case .tmdbBaseUrl:
                return "https://api.themoviedb.org/3"
            }
        }
    }
    
    public enum ApiKey: GenericValueProtocol {
        case apiKey
        
        public typealias Value = String
        
        public var value: String {
            switch self {
            case .apiKey:
                return "85f6ed635a992836f8ba2fd6fb5fa5cb"
            }
        }
    }
    
    public enum MoviesPaths: GenericValueProtocol {
        public typealias Value = String
        
        case popularMovies
        case movieDetails(String)
        case castList(String)
        case videos(String)
        
        public var value: String {
            switch self {
            case .popularMovies:
                return "/movie/popular"
            case .movieDetails(let movieId):
                return "/movie/\(movieId)"
            case .castList(let movieId):
                return "/movie/\(movieId)/credits"
            case .videos(let movieId):
                return "/movie/\(movieId)/videos"
            }
        }
    }
    
    public enum PeoplePaths: GenericValueProtocol {
        public typealias Value = String
        
        case movieCredits(String)
        case personDetails(String)
        
        public var value: String {
            switch self {
            case .movieCredits(let personId):
                return "/person/\(personId)/movie_credits"
            case .personDetails(let personId):
                return "/person/\(personId)"
            }
        }
    }
    
    public enum SearchPaths: GenericValueProtocol {
        public typealias Value = String
        
        case multipleSearch
        
        public var value: String {
            switch self {
            case .multipleSearch:
                return "/search/multi"
            }
        }
    }
 
    
    public enum ImageURL: GenericValueProtocol {
        case imageUrl
        
        public typealias Value = String
        
        public var value: String {
            switch self {
            case .imageUrl:
                return "https://image.tmdb.org/t/p/w500"
            }
        }
    }
}
