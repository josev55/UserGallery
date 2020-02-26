//
//  Album.swift
//  UserGallery
//
//  Created by Jose Vildosola on 24-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

struct AlbumDTO: Decodable {
    var id: Int
    var userId: Int
    var title: String
}
