//
//  UIAlertController+Extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

import Foundation
#if canImport(AudioToolbox)
import AudioToolbox
#endif


public extension UIAlertController {
    static func noButtonAlert(title: String?, message: String?) -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    static func okAlert(title: String?,
                        message: String?,
                        okHandler: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default, handler: okHandler))
        return alert
    }
    
    static func errorAlert(title: String? = "⚠️",
                           error: Error,
                           okHandler: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: "\(error)", preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default, handler: okHandler))
        return alert
    }
    
    static func fieldAlert(title: String?,
                           message: String?,
                           placeholder: String?,
                           handler: ((String?) -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField {
            $0.placeholder = placeholder
        }
        alert.addAction(.init(title: "OK", style: .default, handler: { (action: UIAlertAction) in
            handler?(alert.textFields?.first?.text)
        }))
        alert.addAction(.init(title: "Cancel", style: .cancel, handler: { (action) in
            handler?(nil)
        }))
        return alert
    }
    
    func show(animated: Bool = true, vibrate: Bool = false, completion: (() -> Void)? = nil) {
        UIApplication.shared.keyWindow?.rootViewController?.present(self, animated: animated, completion: completion)
        if vibrate {
            #if canImport(AudioToolbox)
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            #endif
        }
    }
    
    @discardableResult
    func addAction(title: String, style: UIAlertAction.Style = .default, isEnabled: Bool = true, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        let action = UIAlertAction(title: title, style: style, handler: handler)
        action.isEnabled = isEnabled
        addAction(action)
        return action
    }
    
    func addTextField(text: String? = nil, placeholder: String? = nil, editingChangedTarget: Any?, editingChangedSelector: Selector?) {
        addTextField { textField in
            textField.text = text
            textField.placeholder = placeholder
            if let target = editingChangedTarget, let selector = editingChangedSelector {
                textField.addTarget(target, action: selector, for: .editingChanged)
            }
        }
    }
    
    
}
