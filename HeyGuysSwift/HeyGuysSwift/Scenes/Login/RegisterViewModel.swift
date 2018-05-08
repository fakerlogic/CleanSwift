//
//  RegisterViewModel.swift
//  HeyGuysSwift
//
//  Created by Kaola on 2018/5/4.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import UIKit

class RegisterViewModel: ViewModelType {

    let navigator: LoginNavigator
    
    init(navigator: LoginNavigator) {
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        return Output()
    }
    
}


extension RegisterViewModel {
    
    struct Input {
        
    }
    
    struct Output {
        
    }
}
