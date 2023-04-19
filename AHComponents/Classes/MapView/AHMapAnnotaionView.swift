//
//  AHMapAnnotaionView.swift
//  AHComponents
//
//  Created by ByteDance on 2023/4/18.
//

import Foundation
import MapKit

open class AHMapAnnotaionView: MKAnnotationView {
    private override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(annotation anno: MKAnnotation) {
        annotation = anno
        titleLabel.text = anno.title ?? ""
        let textSize = AHLabelTools.getLabelSize(label: titleLabel, maxSize: CGSize(width: CGFLOAT_MAX, height: CGFLOAT_MAX))
        containerView.frame = CGRect(origin: .zero, size: textSize)
        titleLabel.frame = CGRect(origin: .zero, size: textSize)
    }
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14)
        lbl.textColor = AHColorTools.readColor(colorName: "textColor")
        containerView.addSubview(lbl)
        return lbl
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 2
        view.layer.masksToBounds = true
        self.addSubview(view)
        return view
    }()
}
