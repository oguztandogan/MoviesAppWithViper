//
//  LottieAnimationComponentData.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 14.07.2022.
//

import Foundation

class LottieAnimationComponentData: GenericDataProtocol {
    
    var animation: LottieAnimations
    var animationSpeed: Double?
    
    init(animation: LottieAnimations,
         animationSpeed: Double?) {
        
        self.animation = animation
        self.animationSpeed = animationSpeed
    }
}
