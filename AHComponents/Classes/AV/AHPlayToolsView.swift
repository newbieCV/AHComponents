//
//  AHPlayToolsView.swift
//  AHComponents
//
//  Created by ByteDance on 2023/4/25.
//

import Foundation
import UIKit

public class AHPlayToolsView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(playBtn)
        addSubview(lastBtn)
        addSubview(nextBtn)
        addSubview(slideBar)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var clickPlay: ((_ flag: Bool)->())?
    public var clickLast: (()->())?
    public var clickNext: (()->())?
    
    private lazy var playBtn: UIButton = {
        let btn = UIButton(frame: CGRect(origin: CGPoint(x: kScreen.width / 2 - 30, y: 0),
                                         size: CGSize(width: 60, height: 60)))
        btn.setImage(AHImageTools.readImage(imageName: "play"), for: .normal)
        btn.setImage(AHImageTools.readImage(imageName: "pause"), for: .selected)
        btn.addTarget(self, action: #selector(clickPlayBtn), for: .touchUpInside)
        return btn
    }()
    private lazy var lastBtn: UIButton = {
        let btn = UIButton(frame: CGRect(origin: CGPoint(x: kScreen.width / 3 - 40, y: 10),
                                         size: CGSize(width: 40, height: 40)))
        btn.setImage(AHImageTools.readImage(imageName: "last"), for: .normal)
        btn.addTarget(self, action: #selector(clickLastBtn), for: .touchUpInside)
        return btn
    }()
    private lazy var nextBtn: UIButton = {
        let btn = UIButton(frame: CGRect(origin: CGPoint(x: kScreen.width / 3 * 2, y: 10),
                                         size: CGSize(width: 40, height: 40)))
        btn.setImage(AHImageTools.readImage(imageName: "next"), for: .normal)
        btn.addTarget(self, action: #selector(clickNextBtn), for: .touchUpInside)
        return btn
    }()
    
    private lazy var slideBar: UISlider = {
        let bar = UISlider(frame: CGRect(origin: CGPoint(x: 20, y: 80),
                                         size: CGSize(width: kScreen.width - 40, height: 10)))
        var img = AHImageTools.readImage(imageName: "spread")
        img = AHImageTools.tailorImage(image: img, newSize: CGSize(width: 10, height: 20))
        bar.setThumbImage(img, for: .normal)
        return bar
    }()
}

extension AHPlayToolsView {
    @objc
    func clickPlayBtn() {
        playBtn.isSelected = !playBtn.isSelected
        if let callBack = clickPlay {
            callBack(playBtn.isSelected)
        }
    }
    @objc
    func clickLastBtn() {
        if let callBack = clickLast {
            callBack()
        }
    }
    @objc
    func clickNextBtn() {
        if let callBack = clickNext {
            callBack()
        }
    }
}
