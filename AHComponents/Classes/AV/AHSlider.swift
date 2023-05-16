//
//  AHSlider.swift
//  AHComponents
//
//  Created by ByteDance on 2023/5/8.
//

import Foundation

public class AHSlider: UISlider {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        thumbTintColor = .clear
        minimumTrackTintColor = .lightGray
        maximumTrackTintColor = .darkGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AHSlider {
    public override func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
        super.thumbRect(forBounds: bounds,
                                    trackRect: CGRect(origin: CGPoint(x: rect.origin.x - 10, y: rect.origin.y),
                                                      size: CGSize(width: rect.size.width + 22, height: rect.size.height)),
                                    value: value)
    }
}
