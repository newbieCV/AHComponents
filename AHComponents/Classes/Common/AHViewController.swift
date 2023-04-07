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
        
        view.addSubview(bottomView)
    }
    
    private lazy var bottomView : AHBottomBar = {
        let contentNormalHeight = 200
        let view = AHBottomBar(frame: CGRect(x: 0, y: Int(kScreen.height) - contentNormalHeight, width: Int(kScreen.width), height: contentNormalHeight))
        return view
    }()
}
