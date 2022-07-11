//
//  GenericLabelComponent.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import Foundation
import UIKit

public class CommonLabelComponent: AttributedLabel<CommonLabelComponentData> {
    
    public override func loadData() {
        super.loadData()
        guard let data = returnData() else { return }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = data.lineSpacing
        paragraphStyle.alignment = data.allignment
        
        if let attributedInfoText = data.attributedText {
            // Use attributed string is it is provided
            attributedText = attributedInfoText
            return
        }
        
        var attributedString = NSMutableAttributedString()
        attributedString = NSMutableAttributedString(string: data.text ?? "",
                                         attributes: [NSAttributedString.Key.kern : data.kernValue,
                                                     NSAttributedString.Key.paragraphStyle : paragraphStyle,
                                                     NSAttributedString.Key.font : data.textFont,
                                                     NSAttributedString.Key.foregroundColor : data.textColor])
        attributedText = attributedString
    }
}
