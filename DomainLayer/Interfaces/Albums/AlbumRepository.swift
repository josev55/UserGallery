//
//  AlbumRepository.swift
//  UserGallery
//
//  Created by Jose Vildosola on 24-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

protocol AlbumRepository {
    func getAlbumByUserID(userId: Int, completion: @escaping (ServiceStatus<AlbumDTO>)  -> Void) -> URLSessionDataTask
}
