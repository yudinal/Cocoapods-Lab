//
//  CollectionViewCell.swift
//  Cocoapods-Lab
//
//  Created by Lilia Yudina on 3/2/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import UIKit
import SnapKit

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
    
//    public func configureCell(user: User, viewcontroller: UIViewController.Type, savedVenue: SavedVenue? = nil){
//        self.category = category
//        categoryNameLabel.text = category.name
//        restuarantImage.image = UIImage(data: category.image)
//        
//        if viewcontroller == AddCollectionsController.self{
//            addButton.isHidden = false
//            self.savedVenue = savedVenue
//        } else {
//            addGestureRecognizer(longPressGesture)
//            addButton.isHidden = true
//        }
//    }
    
    private func setupUserImage() {
        addSubview(userImage)
        userImage.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalTo(self)
        }
    }
    
    private func setupNameLabelConstraints() {
        addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { (make) in
            make.top.trailing.leading.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
    }
    
    private func setupEmailLabelConstraints() {
        addSubview(userEmailLabel)
        userEmailLabel.snp.makeConstraints { (make) in
            make.trailing.leading.bottom.equalTo(self.safeAreaLayoutGuide).inset(40)
        }
    }
    
}


