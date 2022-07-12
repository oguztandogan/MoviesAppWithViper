//
//  BaseUseCase.swift
//  MoveeWebService
//
//  Created by Hazal Eroglu on 13.12.2020.
//

import Foundation
import RxSwift

public class BaseUseCase<P, T>: BaseUseCaseInterface {

    private let disposeBag = DisposeBag()
    public var useCaseListener: UseCaseListener? = nil
    
    typealias Parameters = P
    typealias Responses = T
    
    func setUseCaseListener(listener: UseCaseListener) {
        self.useCaseListener = listener
    }
    
    func generateUseCase(parameter: P) -> T? {
        return nil
    }
    
    func addDisposable(disposable: Disposable?) {
        guard disposable != nil else {
            return
        }
        disposeBag.insert(disposable!)
        print("disposeBag count : \(disposeBag)")
    }
    
    deinit {
        print("DEINIT BaseUseCase")
    }

}
