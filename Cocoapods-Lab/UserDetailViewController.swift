//
//  UserDetailViewController.swift
//  Cocoapods-Lab
//
//  Created by Lilia Yudina on 3/3/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import UIKit
import Kingfisher

class UserDetailViewController: UIViewController {

    private let detailUserView = DetailUserView()
    
    var user: User?
    
    
    override func loadView() {
        view = detailUserView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
updateUI()
    }
    
    private func updateUI() {
        guard let user = user else {
            fatalError("did not load user from segue")
        }
        let url = URL(string: user.picture.large)!
        detailUserView.userAddressLabel.text = "\(user.location.street) \(user.location.city) \(user.location.state) \(user.location.postcode)"
        detailUserView.userPhoneLabel.text = user.phone.description
        detailUserView.userBirthdayLabel.text = user.dob.date.description
        detailUserView.userImage.kf.setImage(with: url)
    }

}
