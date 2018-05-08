//
//  CategoryNavigator.swift
//  HeyGuysSwift
//
//  Created by Kaola on 2018/4/24.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import Foundation
import UIKit

protocol CategoryNavigator {
    func toCategory()
    
}


class DefaultCategoryNavigator: CategoryNavigator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toCategory() {
        let vc = CategoryViewController()
        vc.viewModel = CategoryViewModel()
        navigationController.pushViewController(vc, animated: true)
    }
}
