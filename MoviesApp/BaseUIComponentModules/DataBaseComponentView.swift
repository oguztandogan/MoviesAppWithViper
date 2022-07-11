//
//  DataBasedComponentView.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import Foundation
import UIKit

open class DataBaseComponentView<T>: BaseView {
    
    private var data: T?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public init(frame: CGRect = .zero, data: T? = nil) {
        self.data = data
        super.init(frame: frame)
        loadDataIntoViews()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    open func setData(data: T?) {
        self.data = data
        loadDataIntoViews()
    }
    
    open func returnData() -> T? {
        return self.data
    }
    
    open func loadDataIntoViews() {
    }
    
}
