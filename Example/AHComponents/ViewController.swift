//
//  ViewController.swift
//  AHComponents
//
//  Created by 章肿鱼 on 04/07/2023.
//  Copyright (c) 2023 章肿鱼. All rights reserved.
//

import UIKit
import AHComponents

class ViewController: AHViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 上拉弹窗
        let popView = loadBottomPopView(contentNormalHeight: 100, contentDetailHeight: 500)
        popView.backgroundColor = .cyan
        
        // 点击toast
        let btn = UIButton()
        btn.backgroundColor = .cyan
        btn.setTitle("toast提示", for: .normal)
        btn.frame = CGRect(origin: CGPoint(x: 0, y: 200), size: CGSize(width: 150, height: 50))
        btn.addTarget(self, action: #selector(clickBtn), for: .touchUpInside)
        view.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var count = 0
    @objc func clickBtn() {
        AHToast.sharedManager().showText(text: "点击了toast提示按钮\(count)", leftImageUrl: nil, duration: 3)
        count += 1
    }
}

