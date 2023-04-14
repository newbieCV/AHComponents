//
//  AHColorTools.swift
//  AHComponents
//
//  Created by ByteDance on 2023/4/8.
//

import Foundation
import UIKit

class AHColorTools: UIColor {
    // 寻找podspec中颜色资源
    internal class func readColor(colorName: String) -> UIColor {
        let bundle = AHTools.findSourceBundle()
        return UIColor(named: colorName, in: bundle, compatibleWith: nil) ?? UIColor()
    }
}
