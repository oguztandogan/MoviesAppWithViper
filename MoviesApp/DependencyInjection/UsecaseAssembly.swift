//
//  UsecaseAssembyl.swift
//  Movee
//
//  Created by Oguz Tandogan on 13.12.2020.
//  Copyright © 2020 Oguz Tandogan. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class UsecaseAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(PopularMoviesUsecase.self, initializer: PopularMoviesUsecase.init).inObjectScope(.weak)
        container.autoregister(MultipleSearchUsecase.self, initializer: MultipleSearchUsecase.init).inObjectScope(.weak)
        container.autoregister(MovieDetailsUsecase.self, initializer: MovieDetailsUsecase.init).inObjectScope(.weak)
        container.autoregister(MovieCastUsecase.self, initializer: MovieCastUsecase.init).inObjectScope(.weak)
        container.autoregister(PersonDetailsUsecase.self, initializer: PersonDetailsUsecase.init).inObjectScope(.weak)
        container.autoregister(VideoUsecase.self, initializer: VideoUsecase.init).inObjectScope(.weak)
        container.autoregister(MovieCreditsUsecase.self, initializer: MovieCreditsUsecase.init).inObjectScope(.weak)


    }
}
