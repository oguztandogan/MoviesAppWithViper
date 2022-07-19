//
//  RepositoryAssembly.swift
//  Movee
//
//  Created by Oguz Tandogan on 13.12.2020.
//  Copyright © 2020 Oguz Tandogan. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class RepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(MoviesRepositoryInterface.self, initializer: MoviesRepository.init).inObjectScope(.weak)
        container.autoregister(SearchRepositoryInterface.self, initializer: SearchOperationsRepository.init).inObjectScope(.weak)
        container.autoregister(PeopleRepositoryInterface.self, initializer: PeopleOperationsRepository.init).inObjectScope(.weak)

    }
}
