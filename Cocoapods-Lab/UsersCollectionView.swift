//
//  UsersCollectionView.swift
//  Cocoapods-Lab
//
//  Created by Lilia Yudina on 3/2/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import UIKit
import SnapKit

class UserCollectionView: UIView {
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemBackground
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
     setupCollectionViewConstraints()
    }
    
    private func setupCollectionViewConstraints() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
