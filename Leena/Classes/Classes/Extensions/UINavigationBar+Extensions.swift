//
//  UINavigationBar+Extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

#if canImport(UIKit)
import UIKit
public extension UINavigationBar {
    func setTitleFont(_ font: UIFont, color: UIColor = .black) {
        var attrs = [NSAttributedString.Key: Any]()
        attrs[.font] = font
        attrs[.foregroundColor] = color
        titleTextAttributes = attrs
    }
    
    
    func makeTransparent(withTint tint: UIColor = .white) {
        isTranslucent = true
        backgroundColor = .clear
        barTintColor = .clear
        setBackgroundImage(UIImage(), for: .default)
        tintColor = tint
        titleTextAttributes = [.foregroundColor: tint]
        shadowImage = UIImage()
    }
    
    func setColors(background: UIColor, text: UIColor) {
        isTranslucent = false
        backgroundColor = background
        barTintColor = background
        setBackgroundImage(UIImage(), for: .default)
        tintColor = text
        titleTextAttributes = [.foregroundColor: text]
    }
    
    func setTitleTextAttributes(_ attributes: [NSAttributedString.Key: Any]) {
        UINavigationBar.appearance().titleTextAttributes = attributes
    }
    
    func setupTitleAppearance(font: UIFont, textColor: UIColor) {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: textColor
        ]
        UINavigationBar.appearance().titleTextAttributes = attributes
    }
    
    func setupLargeTitleAppearance(font: UIFont, textColor: UIColor) {
        if #available(iOS 11.0, *) {
            let attributes: [NSAttributedString.Key: Any] = [
                .font: font,
                .foregroundColor: textColor
            ]
            UINavigationBar.appearance().largeTitleTextAttributes = attributes
        }
    }
    
    func setBarColor(_ barColor: UIColor?) {
        
        if barColor != nil && barColor!.cgColor.alpha == 0 {
            // if transparent color then use transparent nav bar
            self.setBackgroundImage(UIImage(), for: .default)
            self.hideShadow(true)
        } else if barColor != nil {
            // use custom color
            self.setBackgroundImage(self.image(with: barColor!), for: .default)
            self.hideShadow(false)
        } else {
            // restore original nav bar color
            self.setBackgroundImage(nil, for: .default)
            self.hideShadow(false)
        }
    }
    
    func image(with color: UIColor) -> UIImage {
        let rect = CGRect(x: CGFloat(0.0), y: CGFloat(0.0), width: CGFloat(1.0), height: CGFloat(1.0))
        UIGraphicsBeginImageContext(rect.size)
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(rect)
        }
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func hideShadow(_ doHide: Bool) {
        self.shadowImage = doHide ? UIImage() : nil
    }
}
#endif
