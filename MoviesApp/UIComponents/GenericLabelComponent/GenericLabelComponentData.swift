//
//  GenericLabelComponentData.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

public class CommonLabelComponentData {
    private(set) var text: String?
    private(set) var attributedText: NSAttributedString?
    private(set) var textColor: UIColor
    private(set) var textFont: UIFont?
    private(set) var kernValue: CGFloat
    private(set) var lineSpacing: CGFloat
    private(set) var allignment: NSTextAlignment
    
    public convenience init(text: String?,
                            textColor: UIColor = UIColor.black,
                            textFont: UIFont? = UIFont(name: "SF-UI-Display-Regular", size: 12),
                            kernValue: CGFloat = 0.2,
                            lineSpacing: CGFloat = 4,
                            allignment: NSTextAlignment = .center) {
        self.init(text: text,
                  textColor: textColor,
                  textFont: textFont,
                  kernValue: kernValue,
                  lineSpacing: lineSpacing,
                  allignment: allignment)
    }
    
    public convenience init(attributedText: NSAttributedString) {
        self.init(text: nil,
                  attributedText: attributedText)
    }
    
    private init(text: String?,
                 attributedText: NSAttributedString?,
                 textColor: UIColor = UIColor.black,
                 textFont: UIFont? = UIFont(name: "SF-UI-Display-Regular", size: 12),
                 kernValue: CGFloat = 0.2,
                 lineSpacing: CGFloat = 4,
                 allignment: NSTextAlignment = .center) {
        self.text = text
        self.attributedText = attributedText
        self.textColor = textColor
        self.textFont = textFont
        self.kernValue = kernValue
        self.lineSpacing = lineSpacing
        self.allignment = allignment
    }
}
