//
//  UITabBar+Extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

#if canImport(UIKit)
import UIKit
public extension UITabBar {
    
    func setColors(
        background: UIColor? = nil,
        selectedBackground: UIColor? = nil,
        item: UIColor? = nil,
        selectedItem: UIColor? = nil) {
        
        barTintColor = background ?? barTintColor
        
        tintColor = selectedItem ?? tintColor
        
        backgroundImage = UIImage()
        isTranslucent = false
        
        guard let barItems = items else {
            return
        }
        
        if let selectedbg = selectedBackground {
            let rect = CGSize(width: frame.width/CGFloat(barItems.count), height: frame.height)
            selectionIndicatorImage = { (color: UIColor, size: CGSize) -> UIImage in
                UIGraphicsBeginImageContextWithOptions(size, false, 1)
                color.setFill()
                UIRectFill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
                guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage() }
                UIGraphicsEndImageContext()
                guard let aCgImage = image.cgImage else { return UIImage() }
                return UIImage(cgImage: aCgImage)
            }(selectedbg, rect)
        }
        
        if let itemColor = item {
            for barItem in barItems as [UITabBarItem] {

                guard let image = barItem.image else { continue }
                
                barItem.image = { (image: UIImage, color: UIColor) -> UIImage in
                    UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
                    color.setFill()
                    guard let context = UIGraphicsGetCurrentContext() else {
                        return image
                    }
                    
                    context.translateBy(x: 0, y: image.size.height)
                    context.scaleBy(x: 1.0, y: -1.0)
                    context.setBlendMode(CGBlendMode.normal)
                    
                    let rect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
                    guard let mask = image.cgImage else { return image }
                    context.clip(to: rect, mask: mask)
                    context.fill(rect)
                    
                    let newImage = UIGraphicsGetImageFromCurrentImageContext()!
                    UIGraphicsEndImageContext()
                    return newImage
                    }(image, itemColor).withRenderingMode(.alwaysOriginal)
                
                barItem.setTitleTextAttributes([.foregroundColor: itemColor], for: .normal)
                if let selected = selectedItem {
                    barItem.setTitleTextAttributes([.foregroundColor: selected], for: .selected)
                }
            }
        }
    }
}
#endif
