//
//  AHViewController.swift
//  AHComponents
//
//  Created by ByteDance on 2023/4/7.
//

import Foundation
import UIKit

// ViewController的一个基类，方便添加一些共性内容
open class AHViewController: UIViewController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AHColorTools.readColor(colorName: "bgColor")
    }
    
    /**
     * 上拉弹窗：
     * contentNormalHeight，初始高度
     * contentDetailHeight，内容高度
     */
    public func loadBottomPopView(contentNormalHeight: CGFloat, contentDetailHeight:CGFloat) -> AHTableView {
        let bottomPopView = AHBottomPopView(frame: CGRect(origin: CGPoint(x: 0, y: kScreen.height - contentNormalHeight),
                                             size: CGSize(width: kScreen.width, height: contentNormalHeight)))
        bottomPopView.normalHeight = contentNormalHeight
        bottomPopView.contentHeight = contentDetailHeight
        bottomPopView.configUI()
        view.addSubview(bottomPopView)
        return bottomPopView.contentView
    }
}
