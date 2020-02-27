//
//  UserEntityToViewModel.swift
//  UserGallery
//
//  Created by Jose Vildosola on 25-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

class UserEntityToViewModelMapper: Mapper {
    typealias FROM = UserEntity
    typealias TO = UserListViewModel
    
    func map(_ from: UserEntity) -> UserListViewModel {
        return UserListViewModel(id: from.id, name: from.name, username: from.username)
    }
}
