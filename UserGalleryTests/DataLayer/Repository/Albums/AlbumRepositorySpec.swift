//
//  AlbumRepositorySpec.swift
//  UserGalleryTests
//
//  Created by Jose Vildosola on 26-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import XCTest
@testable import UserGallery

class AlbumRepositorySpec: XCTestCase {
    var albumRepository: AlbumRepository!
    
    func testGetAlbumsSuccess() {
        albumRepository = DefaultAlbumRepository(serviceClient: ServiceClientSuccessMock())
        
        let expectation = XCTestExpectation(description: "Album repository succeeds")
        
        albumRepository.getAlbumByUserID(userId: 0) { (status) in
            switch status {
            case .success(_):
                expectation.fulfill()
            default:
                assertionFailure()
            }
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testGetAlbumsFailure() {
        albumRepository = DefaultAlbumRepository(serviceClient: ServiceClientFailureMock())
        
        let expectation = XCTestExpectation(description: "Album repository fails")
        
        albumRepository.getAlbumByUserID(userId: 0) { (status) in
            switch status {
            case .failure(_):
                expectation.fulfill()
            default:
                assertionFailure()
            }
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
