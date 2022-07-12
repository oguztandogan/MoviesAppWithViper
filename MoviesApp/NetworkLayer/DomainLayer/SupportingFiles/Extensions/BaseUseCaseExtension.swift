//
//  BaseUseCaseExtension.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation

public extension BaseUseCase {
    
    func listener(_ listener: UseCaseListener) -> Self {
        self.setUseCaseListener(listener: listener)
        return self
    }
}
