//
//  MockAlbumRepository.swift
//  UserGalleryTests
//
//  Created by Jose Vildosola on 27-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation
@testable import UserGallery

class MockAlbumRepositorySuccess: AlbumRepository {
    func getAlbumByUserID(userId: Int, completion: @escaping (ServiceStatus<[AlbumDTO]>) -> Void) -> URLSessionDataTask {
        completion(.success([AlbumDTO(id: 0, userId: 0, title: "title")]))
        return URLSessionDataTask()
    }
}

class MockAlbumRepositoryFailure: AlbumRepository {
    func getAlbumByUserID(userId: Int, completion: @escaping (ServiceStatus<[AlbumDTO]>) -> Void) -> URLSessionDataTask {
        completion(.failure(.generic(NSError(domain: "", code: -1, userInfo: nil))))
        return URLSessionDataTask()
    }
}
