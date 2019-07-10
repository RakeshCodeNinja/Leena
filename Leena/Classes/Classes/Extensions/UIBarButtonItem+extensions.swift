//
//  UIBarButtonItem+extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 10/07/19.
//  
//  
//

#if os(iOS)
import Foundation
import UIKit

extension UIBarButtonItem {
    
    static func setTitleTextAttributes(_ attributes: [NSAttributedString.Key: Any], for state: UIControl.State = .normal) {
        UIBarButtonItem.appearance().setTitleTextAttributes(attributes, for: state)
    }
    
    static func setupAppearance(font: UIFont, normalTextColor: UIColor, highlightedTextColor: UIColor) {
        let noramlAttributes: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: normalTextColor]
        let highlightedAttributes: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: highlightedTextColor]
        UIBarButtonItem.appearance().setTitleTextAttributes(noramlAttributes, for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(highlightedAttributes, for: .highlighted)
        
    }
    
    func setupTitleAttributes(font: UIFont, textColor: UIColor? = nil, for state: UIControl.State) {
        var attributes: [NSAttributedString.Key: Any] = [:]
        attributes[.font] = font
        if let color = textColor {
            attributes[.foregroundColor] = color
        }
        self.setTitleTextAttributes(attributes, for: state)
    }
    
    private var badgeLayer: CAShapeLayer? {
        guard let b = objc_getAssociatedObject(self, &handle) as AnyObject? else { return nil }
        return b as? CAShapeLayer
    }
    
    var view: UIView? {
        let view = self.value(forKey: "view") as? UIView
        return view
    }
    
    @available(iOS 8.2, *)
    func setBadge(
        _ text: String?,
        offsetFromTopRight: CGPoint    = .init(x: 0, y: 4),
        fillColor: UIColor    = .red,
        textColor: UIColor    = .white,
        font: UIFont    = .systemFont(ofSize: 11, weight: .regular),
        padding: CGSize    = .init(width: 2, height: 6)
        ) {
        badgeLayer?.removeFromSuperlayer()
        guard let text = text, !text.isEmpty else { return }
        addBadge(text, offset: offsetFromTopRight, fillColor: fillColor, textColor: textColor, font: font, padding: padding)
    }
    
    func updateBadge(_ text: String) {
        if let text = self.badgeLayer?.sublayers?.first(where: { $0 is CATextLayer }) as? CATextLayer {
            text.string = text
        }
    }
    
    func removeBadge() {
        badgeLayer?.removeFromSuperlayer()
    }
    
    internal func addBadge(_ text: String, offset: CGPoint, fillColor: UIColor, textColor: UIColor, font: UIFont, padding: CGSize) {
        guard let view = self.view else { return }
        
        let badgeSize = text.size(withAttributes: [.font: font])
        let badge = CAShapeLayer()
        
        let height    = badgeSize.height + padding.height
        var width    = badgeSize.width + padding.width
        
        if (width < height) {
            width = height
        }
        
        let x = view.frame.width - width + offset.x
        let badgeFrame = CGRect(origin: CGPoint(x: x, y: offset.y), size: CGSize(width: width, height: height))
        
        badge.drawRoundedRect(rect: badgeFrame, fillColor: fillColor)
        view.layer.addSublayer(badge)
        
        let label = BarButtonBadgeTextLayer()
        label.string = text
        label.alignmentMode = .center
        label.font = font
        label.fontSize = font.pointSize
        label.frame = badgeFrame
        label.foregroundColor = fillColor.cgColor
        label.backgroundColor = UIColor.clear.cgColor
        label.contentsScale = UIScreen.main.scale
        badge.addSublayer(label)
        
        objc_setAssociatedObject(self, &handle, badge, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
        badge.zPosition = 1_000
    }
    
}

internal var handle: UInt8 = 0

internal class BarButtonBadgeTextLayer: CATextLayer {
    
    override init() {
        super.init()
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(layer: aDecoder)
    }
    
    override func draw(in ctx: CGContext) {
        let height = self.bounds.size.height
        let fontSize = self.fontSize
        let yDiff = (height - fontSize) / 2 - fontSize / 10
        
        ctx.saveGState()
        ctx.translateBy(x: 0.0, y: yDiff)
        super.draw(in: ctx)
        ctx.restoreGState()
    }
}

#endif
