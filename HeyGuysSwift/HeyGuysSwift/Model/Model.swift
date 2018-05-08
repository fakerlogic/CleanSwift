//
//  Model.swift
//  HeyGuysSwift
//
//  Created by Kimi on 2018/5/4.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import Foundation


class Model<T: Codable>: Codable {
    var errorCode: String?
    var errorMsg: String?
    var repeatAct: String?
    var errorCodeInt: Int?
    var succeed: Bool?
    var data: T?
}
