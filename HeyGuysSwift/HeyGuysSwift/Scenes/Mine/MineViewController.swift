//
//  MineViewController.swift
//  HeyGuysSwift
//
//  Created by Kaola on 2018/4/24.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MineViewController: UIViewController {

    private let disposeBag = DisposeBag()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("登录", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.sizeToFit()
        return button
    }()
    
    var viewModel: MineViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: loginButton)
        
        bindViewModel()
    }

    
    private func bindViewModel() {
        let input = MineViewModel.Input(loginTrigger:loginButton.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        output.login.drive().disposed(by: disposeBag)
    }

    

}
