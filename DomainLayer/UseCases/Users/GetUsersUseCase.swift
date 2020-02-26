//
//  GetUsersUseCase.swift
//  UserGallery
//
//  Created by Jose Vildosola on 24-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

protocol GetUsersUseCase {
    func execute(completion: @escaping ([UserEntity]?, Error?) -> Void)
}

class DefaultGetUsersUseCase: GetUsersUseCase {
    private var userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func execute(completion: @escaping ([UserEntity]?, Error?) -> Void) {
        userRepository.getUsers { (serviceStatus) in
            switch serviceStatus {
            case .success(let users):
                if let usersList = users {
                    self.userRepository.users = users
                    let userEntities = usersList.map({ (user) -> UserEntity in
                        UserDtoToEntityMapper().map(user)
                    })
                    completion(userEntities, nil)
                }
            case .failure(let error):
                // TODO: AGREGAR CASO DONDE SE CARGA LA DATA LOCAL
                completion(nil, error)
            }
        }
    }
}
