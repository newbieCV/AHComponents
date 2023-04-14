//
//  AHViewTools.swift
//  AHComponents
//
//  Created by ByteDance on 2023/4/10.
//

import Foundation
import UIKit

public class AHViewTools: UIView {
    // 移除view的子视图
    public class func removeAllSubviews(view: UIView) {
        for subView in view.subviews {
            subView.removeFromSuperview()
        }
    }
}
