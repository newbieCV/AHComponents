//
//  AHBottomPopView.swift
//  AHComponents
//
//  Created by ByteDance on 2023/4/7.
//

import Foundation
import UIKit

class AHBottomPopView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let tapGes = UIPanGestureRecognizer(target: self, action: #selector(slideProgess))
        tapGes.delegate = self
        self.addGestureRecognizer(tapGes)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var normalHeight = 18.0    // 初始高度
    var contentHeight = 18.0   // 内容高度
    let safeGestureArea = 10.0  // 安全距离
    let indicateHeight = 18.0     // 指示器高度
    
    func configUI() {
        self.addSubview(indicateImgView)
        self.addSubview(contentView)
    }
    
    // 指示器
    private lazy var indicateImgView : UIImageView = {
        let view = UIImageView(frame: CGRect(origin: CGPoint(x: (kScreen.width - 38) / 2, y: 0),
                                             size: CGSize(width: 38, height: indicateHeight)))
        view.image = AHImageTools.readImage(imageName: "indicator")
        return view
    }()
    
    // 内容容器
    public lazy var contentView : AHTableView = {
        let frame = CGRect(origin: CGPoint(x: 0, y: self.indicateHeight),
                           size: CGSizeMake(kScreen.width, self.contentHeight))
        let view = AHTableView(frame: frame)
        view.backgroundColor = AHColorTools.readColor(colorName: "bgColor")
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.bounces = false
        
        return view
    }()
    
    // 处理手势相关，用于恢复状态
    private var startPoint = CGPoint(x: 0, y: 0)
    private var startFrame = CGRect.zero
}

// MARK: - 响应手势相关，手势冲突
extension AHBottomPopView: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        otherGestureRecognizer.view == contentView && contentView.contentOffset.y <= 0
    }
}

// MARK: - 滑动处理
extension AHBottomPopView {
    @objc
    private func slideProgess(panGes: UIPanGestureRecognizer) {
        let point = panGes.translation(in: self)
        if (panGes.state == .began) {
            startPoint = point
            startFrame = self.frame
        } else if (panGes.state == .ended || panGes.state == .cancelled) {
            pullUpView(offsetYHeight: startPoint.y - point.y)
        } else if (self.frame.origin.y + point.y >= kScreen.height - self.contentHeight) {
            let offsetYHeight = startFrame.origin.y - startPoint.y + point.y
            self.frame = CGRect(origin: CGPoint(x: startFrame.origin.x, y: offsetYHeight),
                                size: CGSizeMake(kScreen.width, self.contentHeight))
            self.contentView.frame.size = CGSizeMake(kScreen.width, self.contentHeight)
        }
    }
    
    private func pullUpView(offsetYHeight: CGFloat) {
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
            } completion: { _ in
                self.contentView.frame.size = CGSizeMake(kScreen.width, self.normalHeight)
            }
        } else {
            // reset frame
            self.frame = startFrame
        }
    }
}
