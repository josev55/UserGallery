//
//  DefaultPhotoRepository.swift
//  UserGallery
//
//  Created by Jose Vildosola on 24-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

final class DefaultPhotoRepository {
    private var serviceClient: ServiceClient
    
    init(serviceClient: ServiceClient) {
        self.serviceClient = serviceClient
    }
}

extension DefaultPhotoRepository: PhotoRepository {
    @discardableResult
    func getPhotosByAlbumID(albumID: Int, completion: @escaping (ServiceStatus<PhotoDTO>) -> Void) -> URLSessionDataTask {
        return serviceClient.request(with: APIEndpoint.getPhotos(albumId: albumID), completion: completion)
    }
}
