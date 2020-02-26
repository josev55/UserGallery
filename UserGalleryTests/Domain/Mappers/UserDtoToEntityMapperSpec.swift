//
//  UserDtoToEntityMapperSpec.swift
//  UserGalleryTests
//
//  Created by Jose Vildosola on 26-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import XCTest
@testable import UserGallery

class UserDtoToEntityMapperSpec: XCTestCase {
    func testMapUserDTOToEntity() {
        let mockUser = UserDTO(id: 0, name: "J", username: "JV", email: "j@v.cl", address: AddressDTO(street: "", suite: "", city: "", zipcode: "", geo: GeoDTO(lat: "0.1", lng: "0.2")), phone: "", website: "", company: CompanyDTO(name: "", catchPhrase: "", bs: ""))
    }
}
