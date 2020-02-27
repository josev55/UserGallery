//
//  GetAlbumUseCaseSpec.swift
//  UserGalleryTests
//
//  Created by Jose Vildosola on 27-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import XCTest
@testable import UserGallery

class GetAlbumUseCaseSpec: XCTestCase {
    var albumRepositorySuccess: AlbumRepository!
    var albumRepositoryFailure: AlbumRepository!
    var getAlbumUseCase: GetAlbumsUseCase!
    
    override func setUp() {
        albumRepositorySuccess = MockAlbumRepositorySuccess()
        albumRepositoryFailure = MockAlbumRepositoryFailure()
    }
    
    func testGetAlbumByUserIdSuccess() {
        getAlbumUseCase = DefaultGetAlbumsUseCase(albumRepository: albumRepositorySuccess)
        let expectation = XCTestExpectation(description: "Get albums succeeds")
        
        getAlbumUseCase.execute(userId: 0) { (albums, _) in
            XCTAssertNotNil(albums, "Album was nil")
            XCTAssert(!albums!.isEmpty, "Album is empty")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testGetAlbumByUserIdFailure() {
        getAlbumUseCase = DefaultGetAlbumsUseCase(albumRepository: albumRepositoryFailure)
        let expectation = XCTestExpectation(description: "Get albums fails")
        
        getAlbumUseCase.execute(userId: 0) { (_, error) in
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
