//
//  UserListViewMock.swift
//  UserGalleryTests
//
//  Created by Jose Vildosola on 27-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation
@testable import UserGallery

class UserListViewMock: UserListView {
    var didCallSetUsers: Bool = false
    var didCallShowLoading: Bool = false
    var didCallHideLoading: Bool = false
    
    func setUsers(_ users: [UserListViewModel]) {
        didCallSetUsers = true
    }
    
    func showLoading() {
        didCallShowLoading = true
    }
    
    func hideLoading() {
        didCallHideLoading = true
    }
    
    
}
