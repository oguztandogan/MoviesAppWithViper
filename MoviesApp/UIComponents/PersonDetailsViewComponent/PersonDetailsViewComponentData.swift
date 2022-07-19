//
//  PersonDetailsViewComponentData.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 15.07.2022.
//

import Foundation
import UIKit

class PersonDetailsViewComponentData: GenericDataProtocol {
    
    var profilePictureUrl: String?
    var personName: String?
    var biographyText: String?
    
    init(profilePictureUrl: String?,
         personName: String?,
         biographyText: String?) {
        
        self.profilePictureUrl = profilePictureUrl
        self.personName = personName
        self.biographyText = biographyText

    }
}
