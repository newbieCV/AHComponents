//
//  AHScrollerView.swift
//  AHComponents
//
//  Created by ByteDance on 2023/5/5.
//

import Foundation

public class AHScrollerView: UIScrollView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = AHColorTools.readColor(colorName: "bgColor")
        isScrollEnabled = true
        isPagingEnabled = true
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
