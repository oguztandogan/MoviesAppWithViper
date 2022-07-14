//
//  ClientSideAssembly.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 14.07.2022.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class ClientSideAssembly: Assembly {
    
    func assemble(container: Container) {
    
        container.autoregister(LottieManagerProtocol.self, initializer: LottieManager.init).inObjectScope(.container)
        container.autoregister(UseCaseListener.self, initializer: UseCaseListenerManager.init).inObjectScope(.container)
    }
}
