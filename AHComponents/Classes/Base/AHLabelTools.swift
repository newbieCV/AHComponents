//
//  AHLabelTools.swift
//  AHComponents
//
//  Created by 张宗宇 on 2023/4/10.
//

import Foundation
import UIKit

public class AHLabelTools: UILabel {
    // 根据文本内容自动计算文本大小
    public class func getLabelSize(label: UILabel, maxSize: CGSize) -> CGSize {
        return label.sizeThatFits(maxSize)
    }
    
    // 根据宽度动态计算高度
    public class func getLabelHeight(label: UILabel, width: CGFloat) -> CGFloat {
        return label.sizeThatFits(CGSize(width: width, height: CGFloat(MAXFLOAT))).height
    }
    
    // 根据高度动态计算宽度
    public class func getLabelWidth(label: UILabel, height: CGFloat) -> CGFloat {
        return label.sizeThatFits(CGSize(width: CGFloat(MAXFLOAT), height: height)).width
    }
}
