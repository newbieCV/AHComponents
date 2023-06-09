//
//  AHToast.swift
//  AHComponents
//
//  Created by 张宗宇 on 2023/4/9.
//

import Foundation
import UIKit

public final class AHToast: UIView {
    public static let shared = AHToast()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.64)
        layer.cornerRadius = 4
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - 对外暴露的API
extension AHToast {
    public func showText(text: String) {
        showText(text: text, leftImage: nil, duration: nil)
    }
    public func showText(text: String, duration: TimeInterval?) {
        showText(text: text, leftImage: nil, duration: duration)
    }
    public func showText(text: String, leftImage: UIImage?, duration: TimeInterval?) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(hiddenAllToast), object: nil)
        configContent(text: text, leftImage: leftImage)
        self.perform(#selector(hiddenAllToast), with: nil, afterDelay: duration ?? 3)
    }
    
    @objc
    public func hiddenAllToast() {
        self.removeFromSuperview()
    }
}

// MARK: - 设置内容
extension AHToast {
    private func configContent(text: String, leftImage: UIImage?) {
        AHViewTools.removeAllSubviews(view: self)
        // 添加文本
        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        self.addSubview(label)
        // label，view左右边距32，文本距内容左右边距32
        let labelSize = AHLabelTools.getLabelSize(label: label, maxSize: CGSize(width: kScreen.width - 64 - 64, height: CGFloat(MAXFLOAT)))
        
        // 添加左侧图片
        if let leftImg: UIImage = leftImage {
            let image = UIImageView(frame: CGRect(x: 16, y: 18, width: 24, height: 24))
            image.image = leftImg
            self.addSubview(image)
            label.frame = CGRect(origin: CGPoint(x: 44, y: 18), size: labelSize)
            self.frame = CGRect(origin: CGPoint(x: (kScreen.width - labelSize.width - 44 - 16) / 2, y: (kScreen.height - labelSize.height - 36) / 2),
                                         size: CGSize(width: labelSize.width + 16 + 44, height: labelSize.height + 36))
        } else {
            label.frame = CGRect(origin: CGPoint(x: 32, y: 18), size: labelSize)
            self.frame = CGRect(origin: CGPoint(x: (kScreen.width - labelSize.width - 64) / 2, y: (kScreen.height - labelSize.height - 36) / 2),
                                         size: CGSize(width: labelSize.width + 64, height: labelSize.height + 36))
        }
        
        AHTools.getCurKeyWindow().addSubview(self)
    }
}
