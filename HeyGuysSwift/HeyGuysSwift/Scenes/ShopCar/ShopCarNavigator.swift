//
//  ShopCarNavigator.swift
//  HeyGuysSwift
//
//  Created by Kaola on 2018/4/24.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import Foundation
import UIKit

protocol ShopCarNavigator {
    func toShopCar()
}


class DefaultShopCarNavigator: ShopCarNavigator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toShopCar() {
        let vc = ShopCarViewController()
        vc.viewModel = ShopCarViewModel()
        navigationController.pushViewController(vc, animated: true)
    }
}
