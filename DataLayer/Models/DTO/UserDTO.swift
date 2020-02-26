//
//  User.swift
//  UserGallery
//
//  Created by Jose Vildosola on 24-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

struct UserDTO: Decodable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: AddressDTO
    var phone: String
    var website: String
    var company: CompanyDTO
}

struct AddressDTO: Decodable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: GeoDTO
}

struct GeoDTO: Decodable {
    var lat: String
    var lng: String
}

struct CompanyDTO: Decodable {
    var name: String
    var catchPhrase: String
    var bs: String
}
