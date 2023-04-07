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
    
    var normalHeight = 200
    var maxHeight = kScreen.height
    
    private lazy var indicateImgView : UIImageView = {
        let view = UIImageView(frame: CGRect(x: (kScreen.width - 38) / 2, y: 0, width: 38, height: 18))
        view.image = AHImageTools.readImage(imageName: "indicator.jpeg")
        return view
    }()
    
    private lazy var contentView : UIView = {
        let frame = CGRect(x: 0, y: 18, width: Int(kScreen.width), height: normalHeight)
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor(named: "bgColor")
        view.layer.cornerRadius = 8
        return view
    }()
}
