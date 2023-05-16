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
        btn.setImage(AHImageTools.readImage(imageName: "play", tintColor: .lightGray), for: .normal)
        btn.setImage(AHImageTools.readImage(imageName: "pause", tintColor: .lightGray), for: .selected)
        btn.addTarget(self, action: #selector(clickPlayBtn), for: .touchUpInside)
        return btn
    }()
    private lazy var lastBtn: UIButton = {
        let btn = UIButton(frame: CGRect(origin: CGPoint(x: kScreen.width / 3 - 40, y: 10),
                                         size: CGSize(width: 40, height: 40)))
        btn.setImage(AHImageTools.readImage(imageName: "last", tintColor: .lightGray), for: .normal)
        btn.addTarget(self, action: #selector(clickLastBtn), for: .touchUpInside)
        return btn
    }()
    private lazy var nextBtn: UIButton = {
        let btn = UIButton(frame: CGRect(origin: CGPoint(x: kScreen.width / 3 * 2, y: 10),
                                         size: CGSize(width: 40, height: 40)))
        btn.setImage(AHImageTools.readImage(imageName: "next", tintColor: .lightGray), for: .normal)
        btn.addTarget(self, action: #selector(clickNextBtn), for: .touchUpInside)
        return btn
    }()
    
    private lazy var slideBar: UISlider = {
        let bar = AHSlider(frame: CGRect(origin: CGPoint(x: 20, y: 80),
                                         size: CGSize(width: kScreen.width - 40, height: 10)))
        return bar
    }()
}

// MARK: - slide
extension AHPlayToolsView {
    public func updateSlideProgress(curTime: TimeInterval?, duration: TimeInterval?) {
        let value = (curTime ?? 0.0) / (duration ?? 0.0)
        slideBar.setValue(Float(value), animated: true)
    }
}

// MARK: - click event
extension AHPlayToolsView {
    @objc
    func clickPlayBtn() {
        playBtn.isSelected = !playBtn.isSelected
        if let callBack = clickPlay {
            callBack(playBtn.isSelected)
        }
    }
    
    public func changePlayBtn(status: Bool) {
        playBtn.isSelected = status
    }
    
    @objc
    func clickLastBtn() {
        playBtn.isSelected = true
        if let callBack = clickLast {
            callBack()
        }
    }
    @objc
    func clickNextBtn() {
        playBtn.isSelected = true
        if let callBack = clickNext {
            callBack()
        }
    }
}
