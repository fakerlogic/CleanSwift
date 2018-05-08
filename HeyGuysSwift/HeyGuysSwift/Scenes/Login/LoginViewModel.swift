//
//  LoginViewModel.swift
//  HeyGuysSwift
//
//  Created by Kimi on 2018/5/2.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import UIKit

final class LoginViewModel: ViewModelType {
    
    let navigator: LoginNavigator
    
    init(navigator: LoginNavigator) {
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        
        let getCapchaEnable = input.phone.map { phone in
            return phone.count == 11
        }
        
        let loginEnable = Driver.combineLatest(input.phone, input.capcha) { phone, capcha in
            return phone.count == 11 && capcha.count == 4
        }
        
        let getCapcha = input.getCapchaTrigger.withLatestFrom(input.phone).flatMapLatest { phone in
            return NetworkProvider.provider.getCapChaBy(phone).asDriver(onErrorJustReturn: false)
        }
        
        let phoneAndCapcha = Driver.combineLatest(input.phone, input.capcha) { (phone: $0, capcha: $1) }
        
        let login = input.loginTrigger.withLatestFrom(phoneAndCapcha).flatMapLatest { phone, capcha in
            return NetworkProvider.provider.loginBy(phone, capcha: capcha).asDriver(onErrorJustReturn: false)
        }
        
        let dismiss = Driver.of(input.dismissTrigger).merge().do(onNext:({
            self.navigator.dismiss()
        }))
        
        let register = input.registerTrigger.do(onNext:({
            self.navigator.toRegsiter()
        }))
        
        return Output(getCapchaEnable: getCapchaEnable, loginEnable: loginEnable, getCapcha: getCapcha, login: login, dismiss: dismiss, register: register)
    }
}

extension LoginViewModel {
    struct Input {
        // 手机号
        let phone: Driver<String>
        // 验证码
        let capcha: Driver<String>
        // 点击获取验证码
        let getCapchaTrigger: Driver<Void>
        // 点击登录
        let loginTrigger: Driver<Void>
        // 点击关闭
        let dismissTrigger: Driver<Void>
        // 注册
        let registerTrigger: Driver<Void>
    }
    
    struct Output {
        // 是否能点击获取验证码按钮
        let getCapchaEnable: Driver<Bool>
        // 是否能点击登录按钮
        let loginEnable: Driver<Bool>
        // 获取验证码结果
        let getCapcha: Driver<Bool>
        // 登录结果
        let login: Driver<Bool>
        // 关闭当前页面的信号
        let dismiss: Driver<Void>
        // 注册
        let register: Driver<Void>
    }
}
