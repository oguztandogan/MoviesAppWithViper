//
//  AssemblerWireframeInteractorProtocol.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 12.07.2022.
//

import Foundation
import Swinject

protocol AssemblerWireframeInteractorProtocol {
    
}

extension AssemblerWireframeInteractorProtocol {
    
    func returnResolver() -> Resolver {
        return Assembler.sharedAssembler.resolver
    }
}
