//
//  CollectionViewCell.swift
//  Cocoapods-Lab
//
//  Created by Lilia Yudina on 3/2/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    
    public lazy var userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo.fill")
        return imageView
    }()
    
    public lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "User Name"
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    public lazy var userEmailLabel: UILabel = {
        let label = UILabel()
        label.text = "User Email"
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 14, weight: .black)
        return label
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
        setupUserImage()
        setupNameLabelConstraints()
        setupEmailLabelConstraints()
    }
    
    public var user: User?
    
    
    public func configureCell(user: User, viewcontroller: UIViewController.Type) {
        self.user = user
        let url = URL(string: user.picture.thumbnail)!
        userNameLabel.text = "\(user.name.first) \(user.name.last)"
        userEmailLabel.text = user.email
        userImage.kf.setImage(with: url)
    }
    
    private func setupUserImage() {
        addSubview(userImage)
        userImage.snp.makeConstraints { (make) in
            make.top.leading.bottom.equalTo(self)
            make.width.greaterThanOrEqualTo(120)
        }
    }
    
    private func setupNameLabelConstraints() {
        addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { (make) in
            make.top.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
    }
    
    private func setupEmailLabelConstraints() {
        addSubview(userEmailLabel)
        userEmailLabel.snp.makeConstraints { (make) in
            make.trailing.bottom.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
    }
    
}


