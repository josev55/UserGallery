//
//  GetAlbumsUseCase.swift
//  UserGalleryTests
//
//  Created by Jose Vildosola on 27-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

protocol GetAlbumsUseCase {
    func execute(userId: Int, completion: @escaping ([AlbumEntity]?, Error?) -> Void)
}

class DefaultGetAlbumsUseCase: GetAlbumsUseCase {
    private var albumRepository: AlbumRepository
    
    init(albumRepository: AlbumRepository) {
        self.albumRepository = albumRepository
    }
    
    func execute(userId: Int, completion: @escaping ([AlbumEntity]?, Error?) -> Void) {
        albumRepository.getAlbumByUserID(userId: userId) { (status) in
            switch status {
            case .success(let albums):
                let mappedEntities = albums!.map({ (album) -> AlbumEntity in
                    AlbumDtoToEntityMapper().map(album)
                })
                completion(mappedEntities, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
