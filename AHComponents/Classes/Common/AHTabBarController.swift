//
//  AHTabBarController.swift
//  AHComponents
//
//  Created by 张宗宇 on 2023/4/9.
//

import Foundation
import UIKit

open class AHTabBarController: UITabBarController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = AHColorTools.readColor(colorName: "tabBarBgColor")
        tabBar.tintColor = .orange
        tabBar.unselectedItemTintColor = AHColorTools.readColor(colorName: "textColor")
        // 设置文字颜色不跟随tintColor
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: AHColorTools.readColor(colorName: "textColor")], for: .selected)
    }
}
