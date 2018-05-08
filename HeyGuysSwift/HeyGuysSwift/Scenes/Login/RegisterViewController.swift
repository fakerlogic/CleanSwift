//
//  RegisterViewController.swift
//  HeyGuysSwift
//
//  Created by Kaola on 2018/5/4.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import UIKit


class RegisterViewController: QMUICommonViewController {

    
    private let disposeBag = DisposeBag()
    var viewModel: RegisterViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "注册"
    }

    override func preferredNavigationBarHidden() -> Bool {
        return false
    }
    
    override func shouldCustomizeNavigationBarTransitionIfHideable() -> Bool {
        return true
    }

}
