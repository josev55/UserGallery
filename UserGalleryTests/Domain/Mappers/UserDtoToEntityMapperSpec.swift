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
        
        let result = UserDtoToEntityMapper().map(mockUser)
        
        XCTAssert(result.id == 0)
        XCTAssert(result.name == "J")
        XCTAssert(result.email == "j@v.cl")
        XCTAssert(result.address.street == "")
        XCTAssert(result.address.suite == "")
        XCTAssert(result.address.city == "")
        XCTAssert(result.address.zipcode == "")
        XCTAssert(result.address.geo.lat == 0.1)
        XCTAssert(result.address.geo.lng == 0.2)
        XCTAssert(result.phone == "")
        XCTAssert(result.website == "")
        XCTAssert(result.company.name == "")
        XCTAssert(result.company.catchPhrase == "")
        XCTAssert(result.company.bs == "")
    }
    
    func testMapUserFailGeo() {
        let mockUser = UserDTO(id: 0, name: "J", username: "JV", email: "j@v.cl", address: AddressDTO(street: "", suite: "", city: "", zipcode: "", geo: GeoDTO(lat: "", lng: "")), phone: "", website: "", company: CompanyDTO(name: "", catchPhrase: "", bs: ""))
        
        let result = UserDtoToEntityMapper().map(mockUser)
        
        XCTAssert(result.address.geo.lat == 0.0)
        XCTAssert(result.address.geo.lng == 0.0)
    }
}
