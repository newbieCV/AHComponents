//
//  AHImageTools.swift
//  AHComponents
//
//  Created by ByteDance on 2023/4/8.
//

import Foundation
import UIKit

public class AHImageTools: UIImage {
    // 裁剪图片到指定大小
    public class func tailorImage(image: UIImage?, newSize: CGSize) -> UIImage {
        guard let originImg = image else {
            return UIImage()
        }
        UIGraphicsBeginImageContext(newSize)
        originImg.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        let newImg = UIGraphicsGetImageFromCurrentImageContext() ?? originImg
        UIGraphicsEndImageContext()
        return newImg
    }
    // 寻找podspec中图片资源
    class func readImage(imageName: String) -> UIImage {
        let bundle = AHTools.findSourceBundle()
        return UIImage(named: imageName, in: bundle, compatibleWith: nil) ?? UIImage()
    }
}
