//
//  UIImageView+Extensions.swift
//  Project Name: Pods
//
//  Created by Rakesh Sharma on 09/07/19.
//  
//  
//

#if canImport(UIKit)
import UIKit
import Kingfisher

 extension UIImageView {
    enum ImageType: Int {
        case original = 1
        case compressed = 2
        case thumbnail = 3
    }
    
    func setImage(_ imageUrl: String = "", withPlaceholder: String = "", withType imageType: ImageType = .original) {
        if URL(string: imageUrl.fixedArabicURL ?? "") != nil && !imageUrl.isEmpty {
            let resource = ImageResource(downloadURL: URL(string: imageUrl.fixedArabicURL ?? "")!, cacheKey: imageUrl)
            self.kf.setImage(with: resource, placeholder: UIImage(named: withPlaceholder)!)
        } else {
            if !withPlaceholder.isEmpty {
                self.image = UIImage(named: withPlaceholder)
            }
        }
        
    }
    
    func blur(withStyle style: UIBlurEffect.Style = .light) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        addSubview(blurEffectView)
        clipsToBounds = true
    }
    
    func blurred(withStyle style: UIBlurEffect.Style = .light) -> UIImageView {
        let imgView = self
        imgView.blur(withStyle: style)
        return imgView
    }
    
     func scaleImageFrameToWidth(width: CGFloat) {
        guard let image = image else {
            print("Error: The image is not set yet!")
            return
        }
        let widthRatio = image.size.width / width
        let newWidth = image.size.width / widthRatio
        let newHeigth = image.size.height / widthRatio
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: newWidth, height: newHeigth)
    }
    
     func scaleImageFrameToHeight(height: CGFloat) {
        guard let image = image else {
            print("Error: The image is not set yet!")
            return
        }
        let heightRatio = image.size.height / height
        let newHeight = image.size.height / heightRatio
        let newWidth = image.size.width / heightRatio
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: newWidth, height: newHeight)
    }
    
     func roundSquareImage() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}
#endif
