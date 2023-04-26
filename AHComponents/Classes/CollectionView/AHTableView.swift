//
//  AHTableView.swift
//  AHComponents
//
//  Created by ByteDance on 2023/4/26.
//

import Foundation
import UIKit

open class AHTableView: UITableView {
    public override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
