//
//  UserEntityToViewModelSpec.swift
//  UserGalleryTests
//
//  Created by Jose Vildosola on 27-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import XCTest
@testable import UserGallery

class UserEntityToViewModelMapperSpec: XCTestCase {
    func testMapEntityToViewModel() {
        let result = UserEntityToViewModelMapper().map(UserEntity(id: 0, name: "J", username: "jv", email: "j@v.cl", address: AddressEntity(street: "", suite: "", city: "", zipcode: "", geo: (lat: 0.1, lng: 0.2)), phone: "", website: "", company: CompanyEntity(name: "", catchPhrase: "", bs: "")))
        
        XCTAssert(result.id == 0, "Id was \(result.id)")
        XCTAssert(result.name == "J", "Name was \(result.name)")
        XCTAssert(result.username == "jv", "Username was \(result.username)")
    }
}
