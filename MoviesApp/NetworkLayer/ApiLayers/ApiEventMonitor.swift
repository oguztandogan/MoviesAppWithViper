//
//  ApiEventMonitor.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 19.11.2020.
//

import Foundation
import Alamofire

public class ApiEventMonitor: EventMonitor {
    
    // MARK: - To decode JSON response -
    private var jsonDecoder = JSONDecoder()
    
    public init() {
    }
    public func request(_ request: Request, didCreateURLRequest urlRequest: URLRequest) {
        
    }
    
    public func request(_ request: DataRequest, didParseResponse response: DataResponse<Data?, AFError>) {
    }
}
