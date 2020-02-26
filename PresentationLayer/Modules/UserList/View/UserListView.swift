//
//  UserListView.swift
//  UserGallery
//
//  Created by Jose Vildosola on 25-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

protocol UserListView {
    func setUsers(_ users: [UserListViewModel])
    func showLoading()
    func hideLoading()
}
