//
//  AHCollectionView.swift
//  AHComponents
//
//  Created by ByteDance on 2023/4/24.
//

import Foundation
import UIKit

open class AHCollectionView: UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 封装一个layout，避免每次懒加载都默认创建
    public func initWithLayout(scrollDirection: ScrollDirection) -> AHCollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let view = AHCollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.delegate = self
        view.dataSource = self
        view.register(AHCollectionViewCell.self, forCellWithReuseIdentifier: "AHCollectionViewCell")
        return view
    }
}

extension AHCollectionView : UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
}
