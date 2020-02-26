//
//  UserDetailEntityToViewModel.swift
//  UserGallery
//
//  Created by Jose Vildosola on 25-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

class UserDetailEntityToViewModelMapper: Mapper {
    typealias FROM = UserEntity
    typealias TO = UserDetailViewModel
    
    func map(_ from: UserEntity) -> UserDetailViewModel {
        let address = from.address.street
            .appending(" ")
            .appending(from.address.suite)
            .appending(", ")
            .appending(from.address.city)
        let company = from.company.name
        return UserDetailViewModel(id: from.id, name: from.name, username: from.username, email: from.email, address: address, phone: from.phone, website: from.website, company: company)
    }
}
