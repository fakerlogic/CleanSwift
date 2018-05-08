//
//  LoginViewController.swift
//  HeyGuysSwift
//
//  Created by Kimi on 2018/5/2.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import UIKit
import QMUIKit


class LoginViewController: QMUICommonViewController {

    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var capchaTextField: UITextField!
    @IBOutlet weak var getCapchaButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    private let disposeBag = DisposeBag()
    var viewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.titleLabel?.addBottomLine()
        navigationController?.navigationBar.isHidden = true;
        bindViewModel()
    }

    private func bindViewModel() {
        
        let input = LoginViewModel.Input(phone: phoneTextField.rx.text.orEmpty.asDriver(),
                                         capcha: capchaTextField.rx.text.orEmpty.asDriver(),
                                         getCapchaTrigger: getCapchaButton.rx.tap.asDriver(),
                                         loginTrigger: loginButton.rx.tap.asDriver(),
                                         dismissTrigger: dismissButton.rx.tap.asDriver(),
                                         registerTrigger: registerButton.rx.tap.asDriver())
        
        let output = viewModel.transform(input: input)
        output.getCapchaEnable.drive(getCapchaButton.rx.isEnabled).disposed(by: disposeBag)
        output.loginEnable.drive(loginButton.rx.isEnabled).disposed(by: disposeBag)
        output.dismiss.drive().disposed(by: disposeBag)
        output.getCapcha.drive().disposed(by: disposeBag)
        output.register.drive().disposed(by: disposeBag)
        output.login.drive().disposed(by: disposeBag)
    }
    
    override func preferredNavigationBarHidden() -> Bool {
        return true
    }
    
    override func shouldCustomizeNavigationBarTransitionIfHideable() -> Bool {
        return true
    }

}
