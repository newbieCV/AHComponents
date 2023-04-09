//
//  AHToast.swift
//  AHComponents
//
//  Created by 张宗宇 on 2023/4/9.
//

import Foundation
import UIKit

public class AHToast: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
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
    public func showText(text: String, duration: TimeInterval) {
        showText(text: text, leftImage: nil, duration: duration)
    }
    public func showText(text: String, leftImage: UIImage?, duration: TimeInterval?) {
        
    }
    public func hiddenAllToast() {
        
    }
}
