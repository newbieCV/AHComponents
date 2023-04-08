//
//  AHBottomBar.swift
//  AHComponents
//
//  Created by ByteDance on 2023/4/7.
//

import Foundation
import UIKit

class AHBottomBar: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let tapGes = UITapGestureRecognizer()
        self.addGestureRecognizer(tapGes)
        
        self.addSubview(indicateImgView)
        self.addSubview(contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var normalHeight = 18.0    // 初始高度
    var contentHeight = 18.0   // 内容高度
    let safeGestureArea = 10.0  // 安全距离
    let indicateHeight = 18     // 指示器高度
    
    // 指示器
    lazy var indicateImgView : UIImageView = {
        let view = UIImageView(frame: CGRect(origin: CGPoint(x: (kScreen.width - 38) / 2, y: 0),
                                             size: CGSize(width: 38, height: indicateHeight)))
        view.image = AHImageTools.readImage(imageName: "indicator")
        return view
    }()
    
    // 内容容器
    lazy var contentView : UIView = {
        let frame = CGRect(origin: CGPoint(x: 0, y: self.indicateHeight),
                           size: CGSizeMake(kScreen.width, self.contentHeight))
        let view = UIView(frame: frame)
        view.backgroundColor = AHColorTools.readColor(colorName: "bgColor")
        view.layer.cornerRadius = 8
        return view
    }()
    
    // 处理手势相关，用于恢复状态
    var startPoint = CGPoint(x: 0, y: 0)
    var startFrame = CGRect.zero
}

// MARK: - 响应手势相关
extension AHBottomBar: UIGestureRecognizerDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let touch: UITouch = (touches as NSSet).anyObject() as? UITouch {
            startPoint = touch.location(in: superview)
            startFrame = self.frame
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let touch: UITouch = (touches as NSSet).anyObject() as? UITouch {
            let point = touch.location(in: superview)
            let offsetYHeight = self.frame.origin.y - startPoint.y + point.y
            // 防止超出安全区域
            if (offsetYHeight > (kScreen.height - self.contentHeight)) {
                self.frame = CGRect(origin: CGPoint(x: 0, y: offsetYHeight),
                                    size: CGSizeMake(kScreen.width, self.contentHeight))
                self.contentView.frame.size = CGSizeMake(kScreen.width, self.contentHeight)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if let touch: UITouch = (touches as NSSet).anyObject() as? UITouch {
            let point = touch.location(in: superview)
            let offsetYHeight = startPoint.y - point.y
            pullUpView(offsetYHeight: offsetYHeight)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        pullUpView(offsetYHeight: 0)
    }
}

// MARK: - 滑动处理
extension AHBottomBar {
    func pullUpView(offsetYHeight: CGFloat) {
        if (offsetYHeight > safeGestureArea) {
            UIView.animate(withDuration: 0.3) {
                self.frame = CGRect(origin: CGPoint(x: 0, y: Int(kScreen.height - self.contentHeight)),
                                    size: CGSizeMake(kScreen.width, self.contentHeight))
                self.contentView.frame.size = CGSizeMake(kScreen.width, self.contentHeight)
            }
        } else if (offsetYHeight < -safeGestureArea) {
            UIView.animate(withDuration: 0.3) {
                self.frame = CGRect(origin: CGPoint(x: 0, y: Int(kScreen.height - self.normalHeight)),
                                    size: CGSizeMake(kScreen.width, self.normalHeight))
                self.contentView.frame.size = CGSizeMake(kScreen.width, self.normalHeight)
            }
        } else {
            // reset frame
            self.frame = startFrame
        }
    }
}
