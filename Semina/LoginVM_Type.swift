//
// LoginVM_Type.swift
//  Semina
//
//  Created by 이지훈 on 5/27/24.
//

import Foundation
import RxSwift

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(from input: Input, disposeBag: RxSwift.DisposeBag) -> Output
}
