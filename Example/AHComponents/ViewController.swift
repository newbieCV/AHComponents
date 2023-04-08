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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

