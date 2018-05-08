//
//  MineNavigator.swift
//  HeyGuysSwift
//
//  Created by Kaola on 2018/4/24.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import UIKit
import QMUIKit

protocol MineNavigator {
    func toMine()
    func toSetting()
    func toUserInfo()
    func toOrderList()
    func toLogin()
}


class DefaultMineNavigator: MineNavigator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toMine() {
        let vc = MineViewController()
        vc.viewModel = MineViewModel(navigator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toSetting() {
        
    }
    
    func toUserInfo() {
        
    }
    
    func toOrderList() {
        
    }
    
    func toLogin() {
        
        guard let loginVC = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            return
        }
        let nc = QMUINavigationController(rootViewController: loginVC)
        let navigator = DefaultLoginNavigator(navigationController: nc)
        let viewModel = LoginViewModel(navigator: navigator)
        loginVC.viewModel = viewModel
        navigationController.present(nc, animated: true, completion: nil)
    }
    
    
}
