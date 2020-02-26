//
//  PhotoRepository.swift
//  UserGallery
//
//  Created by Jose Vildosola on 24-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

protocol PhotoRepository {
    func getPhotosByAlbumID(albumID: Int, completion: @escaping (ServiceStatus<PhotoDTO>) -> Void) -> URLSessionDataTask
}
