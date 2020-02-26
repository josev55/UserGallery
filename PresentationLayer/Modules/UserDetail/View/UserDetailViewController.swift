//
//  UserDetailViewController.swift
//  UserGallery
//
//  Created by Jose Vildosola on 25-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {

    static func create(userId: Int, userDetailPresenter: UserDetailPresenter) -> UIViewController {
        let vc = UserDetailViewController.instantiate(from: .UserDetail)
        vc.userId = userId
        vc.userDetailPresenter = userDetailPresenter
        vc.userDetailPresenter.view = vc
        return vc
    }
    
    @IBOutlet weak var albumCollectionView: UICollectionView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    private var userId: Int!
    private var userDetailPresenter: UserDetailPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        albumCollectionView.delegate = self
        albumCollectionView.dataSource = self
        
        userDetailPresenter.getUserDetail(userId: userId)
    }
}

extension UserDetailViewController: UserDetailView {
    func setUser(model: UserDetailViewModel) {
        nameLabel.text = model.name
        usernameLabel.text = model.username
        emailLabel.text = model.email
        phoneLabel.text = model.phone
        addressLabel.text = model.address
        websiteLabel.text = model.company
    }
}

extension UserDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size:CGFloat = collectionView.frame.size.width / 2.0 - 15
        return CGSize(width: size, height: size)
    }
}

extension UserDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AlbumCollectionViewCell.self), for: indexPath) as! AlbumCollectionViewCell
        cell.backgroundColor = .random()
        
        return cell
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
