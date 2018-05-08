//
//  Extensions.swift
//  HeyGuysSwift
//
//  Created by Kaola on 2018/5/3.
//  Copyright © 2018年 com.ap-ec.cn. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension ObservableConvertibleType {
    func repeatWhen<O: ObservableType>(_ other: O) -> Observable<E> {
        return other.map { _ in }
            .startWith(())
            .flatMap { () -> Observable<E> in
                self.asObservable()
        }
    }
}

extension Reactive where Base: UIViewController {
    public var viewWillAppear: ControlEvent<Bool> {
        let source = self.methodInvoked(#selector(Base.viewWillAppear)).map { $0.first as? Bool ?? false }
        return ControlEvent(events: source)
    }
}

extension UIViewController {
    
    class func currentViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return currentViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return currentViewController(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            return currentViewController(base: presented)
        }
        return base
    }

}


extension UILabel {
    func addBottomLine() {
        guard let text = self.text else {
            return
        }
        let attributes = [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue]
        let attributeStr = NSAttributedString(string: text, attributes: attributes)
        self.attributedText = attributeStr;
    }
}
