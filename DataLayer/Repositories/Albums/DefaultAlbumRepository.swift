//
//  DefaultAlbumRepository.swift
//  UserGallery
//
//  Created by Jose Vildosola on 24-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

final class DefaultAlbumRepository {
    private var serviceClient: ServiceClient
    
    init(serviceClient: ServiceClient) {
        self.serviceClient = serviceClient
    }
}

extension DefaultAlbumRepository: AlbumRepository {
    @discardableResult
    func getAlbumByUserID(userId: Int, completion: @escaping (ServiceStatus<AlbumDTO>) -> Void) -> URLSessionDataTask {
        return serviceClient.request(with: APIEndpoint.getAlbums(userId: userId), completion: completion)
    }
}
