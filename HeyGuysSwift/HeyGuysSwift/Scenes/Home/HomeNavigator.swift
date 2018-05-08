//
//  HomeNavigator.swift
//  HeyGuysSwift
//
//  Created by Kaola on 2018/4/24.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import Foundation
import UIKit

protocol HomeNavigator {
    func toHome()
    
}


class DefaultHomeNavigator: HomeNavigator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toHome() {
        let vc = HomeViewController()
        vc.viewModel = HomeViewModel()
        navigationController.pushViewController(vc, animated: true)
    }
}
