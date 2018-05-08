//
//  Nibloadable.swift
//  HeyGuysSwift
//
//  Created by Kaola on 2018/5/2.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import UIKit

public protocol Nibloadable {}

extension Nibloadable where Self: UIView {
    static func loadNib(_ nibNmae :String? = nil) -> Self {
        return Bundle.main.loadNibNamed(nibNmae ?? "\(self)", owner: nil, options: nil)?.first as! Self
    }
}

extension UIView : Nibloadable {}
