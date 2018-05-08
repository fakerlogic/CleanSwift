//
//  Application.swift
//  HeyGuysSwift
//
//  Created by Kaola on 2018/4/24.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import Foundation
import NetworkPlatform
//import QMUIKit

final class Application {
    static let shared = Application()
    
    func configureMainInterface(in window: UIWindow) {
        
        let homeNavigationController = UINavigationController()
        
        homeNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage.originImage("home_def"), selectedImage: UIImage.originImage("home_sel"))
        homeNavigationController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        let homeNavigator = DefaultHomeNavigator(navigationController: homeNavigationController)
        
        let categoryNavigationController = UINavigationController()
        categoryNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage.originImage("classification_def"), selectedImage: UIImage.originImage("classification_sel"))
        categoryNavigationController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        let categoryNavigator = DefaultCategoryNavigator(navigationController: categoryNavigationController)
        
        let shopCarNavigationController = UINavigationController()
        shopCarNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage.originImage("Shopping_def"), selectedImage: UIImage.originImage("Shopping_sel"))
        shopCarNavigationController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        let shopCarNavigator = DefaultShopCarNavigator(navigationController: shopCarNavigationController)
        
        let mineNavigationController = QMUINavigationController()
        mineNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage.originImage("my_def"), selectedImage: UIImage.originImage("my_sel"))
        mineNavigationController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        let mineNavigator = DefaultMineNavigator(navigationController: mineNavigationController)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            homeNavigationController,
            categoryNavigationController,
            shopCarNavigationController,
            mineNavigationController]
        window.rootViewController = tabBarController;
        
        homeNavigator.toHome()
        categoryNavigator.toCategory()
        shopCarNavigator.toShopCar()
        mineNavigator.toMine()
    }
}
