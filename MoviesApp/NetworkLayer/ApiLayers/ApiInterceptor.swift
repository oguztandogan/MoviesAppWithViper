//
//  ApiInterceptor.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 19.11.2020.
//

import Foundation
import Alamofire

public class ApiInterceptor: Interceptor {
    
    public init(adapter: ApiAdapter, retrier: ApiRetrier) {
        super.init(adapter: adapter, retrier: retrier)
    }
}
