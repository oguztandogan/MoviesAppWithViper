//
//  VideoComponentData.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 18.07.2022.
//

import Foundation
import UIKit

class VideoComponentData: GenericDataProtocol {
    
    var videoName: String?
    var videoKey: String?
    
    init(videoName: String?,
         videoKey:String?) {
        
        self.videoName = videoName
        self.videoKey = videoKey
    }
}
