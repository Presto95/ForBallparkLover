//
//  UIAlertController+.swift
//  ForBallparkLover
//
//  Created by Presto on 2018. 2. 13..
//  Copyright © 2018년 Presto. All rights reserved.
//

import UIKit

extension UIAlertController {
    @discardableResult
    public static func alert(_ title: String = "", message: String) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        return alertController
    }
    
    
    @discardableResult
    public static func alert(_ title: String = "", message: String, cancelString: String, cancelHandler: (() -> Void)? = nil) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: cancelString, style: .cancel, handler: { (_) in
            cancelHandler?()
        }))
        return alertController
    }
    
    @discardableResult
    public static func alert(_ title: String = "", message: String, defaultString: String, defaultHandler: (() -> Void)? = nil) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: defaultString, style: .default, handler: { (_) in
            defaultHandler?()
        }))
        return alertController
    }
    
    
    @discardableResult
    public static func alert(_ title: String = "", message: String, defaultString: String, cancelString: String, defaultHandler: @escaping (() -> Void), cancelHandler: (() -> Void)? = nil) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: defaultString, style: .default, handler: { (_) in
            defaultHandler()
        }))
        alertController.addAction(UIAlertAction(title: cancelString, style: .cancel, handler: { (_) in
            cancelHandler?()
        }))
        return alertController
    }
    
    
    
    
    
    
    
    //sheet
    
    @discardableResult
    public static func sheet(_ title: String = "", message: String) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        return alertController
    }
    
    @discardableResult
    public static func sheetCancel(_ title: String = "", message: String, cancelString: String, cancelHandler: (() -> Void)? = nil) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: cancelString, style: .cancel, handler: { (_) in
            cancelHandler?()
        }))
        return alertController
    }
    
    @discardableResult
    public static func sheetConfirm(_ title: String = "", message: String, defaultString: String, defaultHandler: (() -> Void)? = nil) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: defaultString, style: .default, handler: { (_) in
            defaultHandler?()
        }))
        return alertController
    }
    
    
    @discardableResult
    public static func sheet(_ title: String = "", message: String, defaultString: String, cancelString: String, defaultHandler: @escaping (() -> Void), cancelHandler: (() -> Void)? = nil) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: defaultString, style: .default, handler: { (_) in
            defaultHandler()
        }))
        alertController.addAction(UIAlertAction(title: cancelString, style: .cancel, handler: { (_) in
            cancelHandler?()
        }))
        return alertController
    }
    
    
    
    
    
    //action
    
    private func action(_ title: String, style: UIAlertActionStyle, handler: ((UIAlertController) -> Void)? = nil) -> UIAlertController{
        self.addAction(UIAlertAction(title: title, style: .default, handler: { (_) in
            handler?(self)
        }))
        return self
    }
    
    @discardableResult
    public func add(_ title: String, handler: ((UIAlertController) -> Void)? = nil) -> UIAlertController{
        return self.action(title, style: .default, handler: handler)
    }
    
    @discardableResult
    public func cancel(_ title: String, handler: ((UIAlertController) -> Void)? = nil) -> UIAlertController{
        return self.action(title, style: .cancel, handler: handler)
    }
    
    @discardableResult
    public func destructive(_ title: String, handler: ((UIAlertController) -> Void)? = nil) -> UIAlertController{
        return self.action(title, style: .destructive, handler: handler)
    }
    
    
    
    
    
    @discardableResult
    public func appendTextField(_ handler: ((UITextField) -> Void)? = nil) -> UIAlertController{
        self.addTextField { (textField) in
            handler?(textField)
        }
        return self
    }
    
    @discardableResult
    public func messageFont(_ font: UIFont) -> UIAlertController{
        let attributedString = NSAttributedString(string: self.message ?? "", attributes: [NSAttributedStringKey.font : font])
        self.setValue(attributedString, forKey: "attributedMessage")
        return self
    }
    
    @discardableResult
    public func titleFont(_ font: UIFont) -> UIAlertController{
        let attributedString = NSAttributedString(string: self.title ?? "", attributes: [NSAttributedStringKey.font : font])
        self.setValue(attributedString, forKey: "attributedTitle")
        return self
    }
    
    
    
    
    //show
    
    @discardableResult
    public func show(_ viewController: UIViewController) -> UIAlertController{
        DispatchQueue.main.async {
            viewController.present(self, animated: true, completion: nil)
        }
        return self
    }
    
    
    
    
    
    
    
    
    //permission
    @discardableResult
    public func openSetting(_ title: String, handler: (() -> Void)? = nil) -> UIAlertController{
        self.addAction(UIAlertAction(title: title, style: .default, handler: { (_) in
            handler?()
            guard let bundleIdentifier = Bundle.main.bundleIdentifier else{
                return
            }
            guard let url = URL(string: "\(UIApplicationOpenSettingsURLString)\(bundleIdentifier)") else{
                return
            }
            if !UIApplication.shared.canOpenURL(url){
                return
            }
            if #available(iOS 8.0, *) {
                UIApplication.shared.openURL(url)
            }else{
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))
        return self
    }
}
