//
//  ShopCarViewController.swift
//  HeyGuysSwift
//
//  Created by Kaola on 2018/4/24.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ShopCarViewController: UIViewController {

    private let disposeBag = DisposeBag()
    
    var viewModel: ShopCarViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.blue
    }

    

}
