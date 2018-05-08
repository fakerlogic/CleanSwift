//
//  LoginNavigator.swift
//  HeyGuysSwift
//
//  Created by Kaola on 2018/5/4.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import UIKit


protocol LoginNavigator {
    func toRegsiter()
    func toProtocol()
    func pop()
    func dismiss()
}

class DefaultLoginNavigator: LoginNavigator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toRegsiter() {
        guard let registerVC = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController else {
            return
        }
        registerVC.viewModel = RegisterViewModel(navigator: self)
        navigationController.pushViewController(registerVC, animated: true)
    }
    
    func toProtocol() {
        
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    func dismiss() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
