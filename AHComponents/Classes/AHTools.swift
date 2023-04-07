//
//  AHTools.swift
//  AHComponents
//
//  Created by 张宗宇 on 2023/4/7.
//

import Foundation
import UIKit

public class AHTools {
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
}
