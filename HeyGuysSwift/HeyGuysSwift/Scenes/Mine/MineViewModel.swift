//
//  MineViewModel.swift
//  HeyGuysSwift
//
//  Created by Kaola on 2018/4/24.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class MineViewModel: ViewModelType {
    
    private let navigator: MineNavigator
    
    init(navigator: MineNavigator) {
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        let login = input.loginTrigger.do(onNext: { self.navigator.toLogin() })
        return Output(login: login)
    }
}

extension MineViewModel {
    struct Input {
        let loginTrigger: Driver<Void>
    }
    
    struct Output {
        let login: Driver<Void>
    }
}
