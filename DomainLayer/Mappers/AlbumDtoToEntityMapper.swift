//
//  AlbumDtoToEntityMapper.swift
//  UserGalleryTests
//
//  Created by Jose Vildosola on 27-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

class AlbumDtoToEntityMapper: Mapper {
    typealias FROM = AlbumDTO
    typealias TO = AlbumEntity
    
    func map(_ from: AlbumDTO) -> AlbumEntity {
        return AlbumEntity(id: from.id, title: from.title)
    }
}
