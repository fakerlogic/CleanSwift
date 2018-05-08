//
//  Reusable.swift
//  HeyGuysSwift
//
//  Created by Kaola on 2018/4/24.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import UIKit


public struct TT<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public extension UITableView {
    public var tt: TT<UITableView> {
        return TT(self)
    }
}

public extension UITableViewCell {
    public var tt: TT<UITableViewCell> {
        return TT(self)
    }
}

protocol Reusable: class {
    static var reuseID: String { get }
}

//public extension TT where Base: UITableViewCell {
//    public var reuseIdentifier: String {
//        return "\(String(describing: self))ReuseIdentifier"
//    }
//
//}

extension UITableViewCell: Reusable {
    static var reuseID: String {
        return "\(String(describing: self))ReuseIdentifier"
    }
}

public extension TT where Base: UITableView {
    
    public func dequeCell<T: UITableViewCell>(_: T.Type) -> T {
        var cell =  base.dequeueReusableCell(withIdentifier: T.reuseID)
        if cell == nil {
            cell = T(style: UITableViewCellStyle.default, reuseIdentifier: T.reuseID)
        }
        return cell as! T
    }
}

extension UIStoryboard {
    func instantiateViewController<T: Reusable>(ofType type: T.Type = T.self) -> T where T: UIViewController {
        guard let viewController = instantiateViewController(withIdentifier: type.reuseID) as? T else {
            fatalError()
        }
        return viewController
    }
}
