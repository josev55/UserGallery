//
//  PhotoRepositorySpec.swift
//  UserGalleryTests
//
//  Created by Jose Vildosola on 26-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import XCTest
@testable import UserGallery

class PhotoRepositorySpec: XCTestCase {
    var photoRepository: PhotoRepository!
    
    func testGetPhotosSuccess() {
        photoRepository = DefaultPhotoRepository(serviceClient: ServiceClientSuccessMock())
        
        let expectation = XCTestExpectation(description: "Photo repository succeed")
        
        photoRepository.getPhotosByAlbumID(albumID: 0) { (status) in
            switch status {
            case .success(_):
                expectation.fulfill()
            default:
                assertionFailure()
            }
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testGetPhotosFailure() {
        photoRepository = DefaultPhotoRepository(serviceClient: ServiceClientFailureMock())
        
        let expectation = XCTestExpectation(description: "Photo repository fails")
        
        photoRepository.getPhotosByAlbumID(albumID: 0) { (status) in
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
