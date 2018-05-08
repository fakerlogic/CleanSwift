//
//  ViewController.swift
//  HeyGuysSwift
//
//  Created by Kaola on 2018/3/14.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        let resultController = UIViewController()
        let searchController = UISearchController(searchResultsController: resultController)
        searchController.searchBar.placeholder = "搜搜"
        navigationItem.titleView = searchController.searchBar;

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(register))
        
        
        APIService.apiService.getCapchaCode("17620441036", type: CapchaType.login.capchaTypeCode).subscribe(onNext: { ele in
//            print("result\($0)")
        }, onError: { error in
            print(error)
        }, onCompleted: {
//            print("complete")
        }).disposed(by: disposeBag)
    }


    @objc func register() {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
}


