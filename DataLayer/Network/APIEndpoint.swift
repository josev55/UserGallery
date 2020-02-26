//
//  APIEndpoint.swift
//  UserGallery
//
//  Created by Jose Vildosola on 24-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

final class APIEndpoint {
    static func getUsers() -> Endpoint {
        return Endpoint(path: "/users")
    }
    
    static func getAlbums(userId: Int) -> Endpoint {
        return Endpoint(path: "/albums", method: .get, queryParameters: ["userId": userId], headerParameters: [:], bodyParameters: [:])
    }
    
    static func getPhotos(albumId: Int) -> Endpoint {
        return Endpoint(path: "/photos", method: .get, queryParameters: ["albumId": albumId], headerParameters: [:], bodyParameters: [:])
    }
}
