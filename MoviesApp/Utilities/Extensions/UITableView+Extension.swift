//
//  UITableViewCell+Extension.swift
//  MoviesApp
//
//  Created by Oguz Tandogan on 10.07.2022.
//

import UIKit

extension UITableView {
    
    func genericRegisterCell<T>(_ type: T.Type) where T: BaseTableViewCell {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }
    
    func genericDequeCell<T>(indexPath: IndexPath) -> T? where T: BaseTableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else { fatalError() }
        return cell
    }
    
}
