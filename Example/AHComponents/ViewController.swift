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
        let toastBtn = UIButton()
        toastBtn.backgroundColor = .cyan
        toastBtn.setTitle("toast提示", for: .normal)
        toastBtn.frame = CGRect(origin: CGPoint(x: 0, y: 100), size: CGSize(width: 150, height: 50))
        toastBtn.addTarget(self, action: #selector(clickToastBtn), for: .touchUpInside)
        view.addSubview(toastBtn)
        
        // 震动
        let shakeBtn = UIButton()
        shakeBtn.backgroundColor = .gray
        shakeBtn.setTitle("响铃/震动", for: .normal)
        shakeBtn.frame = CGRect(origin: CGPoint(x: 0, y: 200), size: CGSize(width: 150, height: 50))
        shakeBtn.addTarget(self, action: #selector(clickShakeBtn), for: .touchUpInside)
        view.addSubview(shakeBtn)
        
        // 响铃
        let ringBtn = UIButton()
        ringBtn.backgroundColor = .gray
        ringBtn.setTitle("停止响铃震动", for: .normal)
        ringBtn.frame = CGRect(origin: CGPoint(x: 0, y: 250), size: CGSize(width: 150, height: 50))
        ringBtn.addTarget(self, action: #selector(stopShakeBtn), for: .touchUpInside)
        view.addSubview(ringBtn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var count = 0
    @objc
    func clickToastBtn() {
        AHToast.shared.showText(text: "点击了toast提示按钮\(count)")
        count += 1
    }
    
    @objc
    func clickShakeBtn() {
        AHShakeOrRingTools.shared.ringOrShake(type: .ringAndShake, duration: 5)
    }
    @objc
    func stopShakeBtn() {
        AHShakeOrRingTools.shared.stopRingAndShake()
    }
    
}

