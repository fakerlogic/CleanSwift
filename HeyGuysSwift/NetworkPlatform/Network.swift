//
//  Network.swift
//  NetworkPlatform
//
//  Created by Kaola on 2018/4/24.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire


final class Network<T> {
    
    private let baseURL: String
    private let scheduler: ConcurrentDispatchQueueScheduler
    
    private let headers: HTTPHeaders = [
        "Accept": "application/json",
        "source-type" : "ios",
        "encryptType" : "2",
        "type" : "cs",
        "UA" : (UIDevice.current.identifierForVendor?.uuidString)!,
        "IMEI" : UIDevice.current.ua,
        ]
    
    init(_ baseURL: String) {
        self.baseURL = baseURL
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
    }
    
//    func post(_ path: String) -> Observable<T> {
//        let absolutePath = "\(baseURL)/\(path)"
//        return RxAlamofire.requestJSON(.post, absolutePath).debug().observeOn(scheduler).map({ JSON -> T in
//            return T
//        })
//    }
    
}




