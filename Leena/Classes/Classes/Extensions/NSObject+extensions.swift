//
//  NSObject+extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

#if os(iOS)
import Foundation
import SwiftMessages

public extension NSObject {
    enum MesageAlertType {
        case success
        case warning
        case error
        case info
    }
    
    var className: String {
        return type(of: self).className
    }
    
    static var className: String {
        return String(describing: self)
    }
    
    func showMessage(type: MesageAlertType = .success, layout: MessageView.Layout = .tabView, title: String = "Success", message: String = "Something good happened!!", isButtonHidden: Bool = true, presentationStyle: SwiftMessages.PresentationStyle = .top) {
        let success = MessageView.viewFromNib(layout: layout)
        switch type {
        case .success:
            success.configureTheme(.success)
        case .warning:
            success.configureTheme(.warning)
        case .error:
            success.configureTheme(.error)
        case .info:
            success.configureTheme(.info)
        }
        
        success.configureDropShadow()
        
        success.configureContent(title: title, body: message)
        success.button?.isHidden = isButtonHidden
        var successConfig = SwiftMessages.defaultConfig
        successConfig.presentationStyle = presentationStyle
        successConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        SwiftMessages.show(config: successConfig, view: success)
    }
    
   
}

#endif
