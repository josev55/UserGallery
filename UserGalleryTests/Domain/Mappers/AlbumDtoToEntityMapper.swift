//
//  AlbumDtoToEntityMapper.swift
//  UserGalleryTests
//
//  Created by Jose Vildosola on 27-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import XCTest
@testable import UserGallery

class AlbumDtoToEntityMapperSpec: XCTestCase {
    func testMapDTOToEntityCorrectly() {
        let result = AlbumDtoToEntityMapper().map(AlbumDTO(id: 0, userId: 0, title: "TestPhotos"))
        
        XCTAssert(result.id == 0)
        XCTAssert(result.title == "TestPhotos")
    }
}
