//
//  ApiRetrier.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 19.11.2020.
//

import Foundation
import Alamofire

public class ApiRetrier: RequestRetrier {
    
    public init() {
        
    }
    
    public func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard let task = request.task, let response = task.response as? HTTPURLResponse else {
            completion(.doNotRetry)
            return
        }
        completion(.doNotRetry)
        
        switch response.statusCode {
        case 403:
            print("token refresh is required")
            completion(.retry)
        default:
            completion(.doNotRetry)
        }
    }
}
