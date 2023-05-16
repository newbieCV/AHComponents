//
//  AHColorTools.swift
//  AHComponents
//
//  Created by ByteDance on 2023/4/8.
//

import Foundation
import UIKit

public class AHColorTools: UIColor {
    /// 颜色转纯色图片
    public class func convertImage(color: UIColor, size: CGSize) -> UIImage {
        var img: UIImage?
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(CGRect(origin: .zero, size: size))
        img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let img = img {
            return img
        }
        return img ?? UIImage()
    }
    
    /// 寻找podspec中颜色资源
    internal class func readColor(colorName: String) -> UIColor {
        let bundle = AHTools.findSourceBundle()
        return UIColor(named: colorName, in: bundle, compatibleWith: nil) ?? UIColor()
    }
}
