//
//  ApiRemoteAssembly.swift
//  Movee
//
//  Created by Oguz Tandogan on 13.12.2020.
//  Copyright © 2020 Oguz Tandogan. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class ApiRemoteAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(MoviesRemoteInterface.self, initializer: MoviesRemote.init).inObjectScope(.weak)
        container.autoregister(SearchRemoteInterface.self, initializer: SearchOperationsRemote.init).inObjectScope(.weak)
        container.autoregister(PeopleRemoteInterface.self, initializer: PeopleOperationsRemote.init).inObjectScope(.weak)

    }
}
