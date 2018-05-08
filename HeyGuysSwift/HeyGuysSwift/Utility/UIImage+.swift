//
//  UIImage+.swift
//  HeyGuysSwift
//
//  Created by Kaola on 2018/4/24.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import UIKit

extension UIImage {
    static func originImage(_ name: String) -> UIImage {
        let image = UIImage(named: name)
        return image!.withRenderingMode(.alwaysOriginal)
    }
}
