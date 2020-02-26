//
//  UserEntity.swift
//  UserGallery
//
//  Created by Jose Vildosola on 24-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

struct UserEntity {
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: AddressEntity
    var phone: String
    var website: String
    var company: CompanyEntity
}

struct AddressEntity {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: (lat: Double, lng: Double)
}

struct CompanyEntity {
    var name: String
    var catchPhrase: String
    var bs: String
}
