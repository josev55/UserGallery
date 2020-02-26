//
//  Photo.swift
//  UserGallery
//
//  Created by Jose Vildosola on 24-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

struct PhotoDTO: Decodable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
