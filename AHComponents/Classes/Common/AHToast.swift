//
//  AHToast.swift
//  AHComponents
//
//  Created by 张宗宇 on 2023/4/9.
//

import Foundation
import UIKit

public final class AHToast: UIView {
    private static let instance = AHToast()
    public class func sharedManager() -> AHToast {
        return instance
    }
    
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
        showText(text: text, leftImage: nil, leftImageUrl: nil, duration: nil)
    }
    public func showText(text: String, leftImage: UIImage?, duration: TimeInterval?) {
        showText(text: text, leftImage: leftImage, leftImageUrl: nil, duration: duration)
    }
    public func showText(text: String, leftImageUrl: String?, duration: TimeInterval?) {
        showText(text: text, leftImage: nil, leftImageUrl: leftImageUrl, duration: duration)
    }
    /// 内部处理集合方法，leftImage和leftImageUrl不同时存在
    fileprivate func showText(text: String, leftImage: UIImage?, leftImageUrl: String?, duration: TimeInterval?) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(hiddenAllToast), object: nil)
        configContent(text: text, leftImage: leftImage, leftImageUrl: leftImageUrl)
        self.perform(#selector(hiddenAllToast), with: nil, afterDelay: duration ?? 3)
    }
    
    @objc
    public func hiddenAllToast() {
        self.removeFromSuperview()
    }
}

// MARK: - 设置内容
extension AHToast {
    private func configContent(text: String, leftImage: UIImage?, leftImageUrl: String?) {
        AHViewTools.removeAllSubviews(view: self)
        // 添加文本
        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        self.addSubview(label)
        // label，view左右边距32，文本距内容左右边距8
        let labelSize = AHLabelTools.getLabelSize(label: label, maxSize: CGSize(width: kScreen.width - 64 - 16, height: CGFloat(MAXFLOAT)))
        
        // 添加左侧图片
        if let leftImg: UIImage = leftImage {
            let image = UIImageView(frame: CGRect(x: 4, y: 4, width: 16, height: 16))
            image.image = leftImg
            self.addSubview(image)
            label.frame = CGRect(origin: CGPoint(x: 24, y: 4), size: labelSize)
            self.frame = CGRect(origin: CGPoint(x: (kScreen.width - labelSize.width - 16) / 2, y: (kScreen.height - labelSize.height - 8) / 2),
                                         size: CGSize(width: labelSize.width + 16 + 16, height: labelSize.height + 8))
        } else if let leftImg: UIImage = AHImageTools.getImage(url: leftImageUrl) {
            let image = UIImageView(frame: CGRect(x: 4, y: 4, width: 16, height: 16))
            image.image = leftImg
            self.addSubview(image)
            label.frame = CGRect(origin: CGPoint(x: 24, y: 4), size: labelSize)
            self.frame = CGRect(origin: CGPoint(x: (kScreen.width - labelSize.width - 16) / 2, y: (kScreen.height - labelSize.height - 8) / 2),
                                         size: CGSize(width: labelSize.width + 16 + 16, height: labelSize.height + 8))
        } else {
            label.frame = CGRect(origin: CGPoint(x: 8, y: 4), size: labelSize)
            self.frame = CGRect(origin: CGPoint(x: (kScreen.width - labelSize.width - 16) / 2, y: (kScreen.height - labelSize.height - 8) / 2),
                                         size: CGSize(width: labelSize.width + 16, height: labelSize.height + 8))
        }
        
        UIApplication.shared.keyWindow?.addSubview(self)
    }
}
