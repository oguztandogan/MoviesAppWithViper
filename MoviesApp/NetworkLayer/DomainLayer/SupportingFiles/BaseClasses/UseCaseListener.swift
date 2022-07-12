//
//  UseCaseListener.swift
//  MoveeWebService
//
//  Created by Hazal Eroglu on 13.12.2020.
//

import Foundation

public protocol UseCaseListener {
    
    func useCasePreExecute()
    
    func useCasePostExecute()
    
}
