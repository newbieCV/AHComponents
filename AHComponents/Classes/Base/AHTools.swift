//
//  AHTools.swift
//  AHComponents
//
//  Created by ByteDance on 2023/4/8.
//

import Foundation
import UIKit

public struct kScreen {
    public static let width = UIScreen.main.bounds.width
    public static let height = UIScreen.main.bounds.height
}

public class AHTools {
    // 获取资源文件Bundler
    internal class func findSourceBundle() -> Bundle {
        /// podfile中使用了use_frameworks!
        /// Swift会导致资源放到Frameworks中，而非bundle，查找比较麻烦
        var url = Bundle.main.url(forResource: "Frameworks", withExtension: nil)
        url = url?.appendingPathComponent("AHComponents")
        url = url?.appendingPathExtension("framework")
        let bundle = Bundle(url: url!)
        if let res = bundle?.url(forResource: "AHComponents", withExtension: "bundle") {
            return Bundle(url: res) ?? Bundle.main
        } else {
            return Bundle.main
        }
    }
    // 获取keyWindow
    public class func getCurKeyWindow() -> UIWindow {
        var window : UIWindow?
        if #available(iOS 15.0, *),
           let windowScene: UIWindowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            window = windowScene.keyWindow
        }
        return window ?? UIApplication.shared.keyWindow ?? UIWindow()
    }
}
