//
//  APIEndpointSpec.swift
//  UserGalleryTests
//
//  Created by Jose Vildosola on 26-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import XCTest
@testable import UserGallery

class APIEndpointSpec: XCTestCase {
    func testGetUsersEndpoint() {
        let result = APIEndpoint.getUsers()
        
        XCTAssert(result.path == "/users")
        XCTAssert(result.method == .get)
        XCTAssert(result.headerParameters == [:])
        XCTAssert(result.queryParameters.isEmpty)
        XCTAssert(result.bodyParameters.isEmpty)
    }
    
    func testGetAlbumEndpoint() {
        let result = APIEndpoint.getAlbums(userId: 0)
        
        XCTAssert(result.path == "/albums")
        XCTAssert(result.method == .get)
        XCTAssert(result.headerParameters == [:])
        XCTAssert(result.queryParameters["userId"] as! Int == 0)
        XCTAssert(result.bodyParameters.isEmpty)
    }
    
    func testGetPhotosEndpoint() {
        let result = APIEndpoint.getPhotos(albumId: 0)
        
        XCTAssert(result.path == "/photos")
        XCTAssert(result.method == .get)
        XCTAssert(result.headerParameters == [:])
        XCTAssert(result.queryParameters["albumId"] as! Int == 0)
        XCTAssert(result.bodyParameters.isEmpty)
    }
}
