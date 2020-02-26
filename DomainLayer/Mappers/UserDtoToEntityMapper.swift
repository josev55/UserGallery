//
//  UserDtoToEntityMapper.swift
//  UserGallery
//
//  Created by Jose Vildosola on 24-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

class UserDtoToEntityMapper: Mapper {
    typealias FROM = UserDTO
    typealias TO = UserEntity
    
    func map(_ from: UserDTO) -> UserEntity {
        let addressEntity = AddressEntity(street: from.address.street, suite: from.address.suite, city: from.address.city, zipcode: from.address.zipcode, geo: (lat: Double(from.address.geo.lat) ?? 0.0, lng: Double(from.address.geo.lng) ?? 0.0))
        let companyEntity = CompanyEntity(name: from.company.name, catchPhrase: from.company.catchPhrase, bs: from.company.bs)
        
        return UserEntity(id: from.id, name: from.name, username: from.username, email: from.email, address: addressEntity, phone: from.phone, website: from.website, company: companyEntity)
    }
}
