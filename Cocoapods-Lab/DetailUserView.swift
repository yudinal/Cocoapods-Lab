//
//  DetailUserView.swift
//  Cocoapods-Lab
//
//  Created by Lilia Yudina on 3/3/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class DetailUserView: UIView {

    public lazy var userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo.fill")
        return imageView
    }()
    
    public lazy var userAddressLabel: UILabel = {
        let label = UILabel()
        label.text = "User Address"
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    public lazy var userPhoneLabel: UILabel = {
        let label = UILabel()
        label.text = "User Phone"
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    public lazy var userBirthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "User Phone"
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
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
            
        }
    
    
    

}
