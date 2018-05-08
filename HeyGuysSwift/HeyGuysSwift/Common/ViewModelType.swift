//
//  ViewModelType.swift
//  HeyGuysSwift
//
//  Created by Kaola on 2018/4/24.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import Foundation


protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

