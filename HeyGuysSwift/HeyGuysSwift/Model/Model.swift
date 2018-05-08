//
//  Model.swift
//  HeyGuysSwift
//
//  Created by Kimi on 2018/5/4.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import Foundation


final class Model<T: Codable>: Codable {
    var errorCode: String?
    var errorMsg: String?
    var repeatAct: String?
    var errorCodeInt: Int?
    var succeed: Bool?
    var data: T?
}


final class UserInfo: Codable {
    var accountNo: String?
    var ID: String?
    var passwordFlag: String?
    var userAddress: String?
    var areacounty: String?
    var invitationNumber: String?
    var userPhone: String?
    var province: String?
    var street: String?
    var code: String?
    var userName: String?
    var userLevel: String?
    var city: String?
    var openId: String?
    var shopName: String?
    var cityId: String?
    var detailedAddress: String?
    
}

