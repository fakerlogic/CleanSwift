//
//  NetworkProvider.swift
//  HeyGuysSwift
//
//  Created by Kaola on 2018/5/3.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Moya
import Result


protocol Network {
    func loginBy(_ phone: String, capcha: String) -> Observable<UserInfo?>
    func getCapChaBy(_ phone: String) -> Observable<Bool>
}

class NetworkProvider: Network {
    static let provider = NetworkProvider()
    private init() {}
    
}

extension NetworkProvider {
    
    func loginBy(_ phone: String, capcha: String) -> Observable<UserInfo?> {
        
        return loginAPIProvider.rx.request(.login(phone, capcha)).debug().asObservable().mapObject(type: Model<UserInfo>.self).map({ model in
            
            return model.data ?? nil
        })
    }
    
    func getCapChaBy(_ phone: String) -> Observable<Bool> {
        return loginAPIProvider.rx.request(.getCapcha(phone)).debug().asObservable().mapObject(type: Model<Bool>.self).map({ model in
            print(model)
            return model.data ?? false
        })
    }
}

public extension ObservableType where E == Response {
    /// Maps data received from the signal into an object which implements the ALSwiftyJSONAble protocol.
    /// If the conversion fails, the signal errors.
    public func mapObject<T: Codable>(type: T.Type) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            return Observable.just(try response.mapObject(type: type))
        }
    }
    /// Maps data received from the signal into an array of objects which implement the ALSwiftyJSONAble protocol.
    /// If the conversion fails, the signal errors.
    
    public func mapArray<T: Codable>(type: T.Type) -> Observable<[T]> {
        return flatMap { response -> Observable<[T]> in
            return Observable.just(try response.mapArray(type: type))
        }
    }
}



public extension Response {
    /// Maps data received from the signal into an object which implements the ALSwiftyJSONAble protocol.
    /// If the conversion fails, the signal errors.\
    public func mapObject<T: Codable>(type:T.Type) throws -> T {
        do {
            let mappedObject = try  JSONDecoder().decode(T.self, from: data)
            return mappedObject
        } catch  {
            throw Moya.MoyaError.jsonMapping(self)
        }
        
    }
    
    /// Maps data received from the signal into an array of objects which implement the ALSwiftyJSONAble protocol
    /// If the conversion fails, the signal errors.
    public func mapArray<T: Codable>(type:T.Type) throws -> [T] {
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
            throw Moya.MoyaError.jsonMapping(self)
        }
        let dict = json as? [String: Any]
        guard let array = dict?["data"],
            let arrayData = try? JSONSerialization.data(withJSONObject: array, options: []) else {
                throw Moya.MoyaError.jsonMapping(self)
        }
        guard let mappedObject = try? JSONDecoder().decode([T].self, from: arrayData) else {
            throw Moya.MoyaError.jsonMapping(self)
        }
        return mappedObject
    }
}

