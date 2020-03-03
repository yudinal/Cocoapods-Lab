//
//  ViewController.swift
//  Cocoapods-Lab
//
//  Created by Lilia Yudina on 3/2/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    private let userCollectionView = UserCollectionView()
    
    public var users = [User]() {
        didSet{
            DispatchQueue.main.async {
                self.userCollectionView.collectionView.reloadData()
            }
            
        }
    }
    
    override func loadView() {
        view = userCollectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        userCollectionView.collectionView.dataSource = self
        userCollectionView.collectionView.delegate = self
        userCollectionView.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        fetchUsers()
    }
    private func fetchUsers() {
        UsersAPIClient.fetchUsers { (result) in
            switch result {
            case .failure(let error):
                print("\(error)")
            case .success(let user):
                self.users = user
            }
        }
    }
    


}

extension UserViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? CollectionViewCell else {
            fatalError("could not downcast to CollectionViewCell")
        }
        cell.backgroundColor = .systemBackground
       // cell.delegate = self
        
    let user = users[indexPath.row]
        cell.configureCell(user: user, viewcontroller: UserViewController.self)
        return cell
    }
}

extension UserViewController: UICollectionViewDelegateFlowLayout {

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let maxSize: CGSize = UIScreen.main.bounds.size
    let itemWidth: CGFloat = maxSize.width * 0.95
    return CGSize(width: itemWidth, height: 120)
}

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           let user = users[indexPath.row]
    let detailViewController = UserDetailViewController()
    detailViewController.user = user
    navigationController?.pushViewController(detailViewController, animated: true)
    }
}
