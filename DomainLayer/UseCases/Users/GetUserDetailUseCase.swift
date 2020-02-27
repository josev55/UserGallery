//
//  GetUserDetailUseCase.swift
//  UserGallery
//
//  Created by Jose Vildosola on 25-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

protocol GetUserDetailUseCase {
    func execute(userId: Int, completion: @escaping (UserEntity?) -> Void)
}

class DefaultGetUserDetailUseCase: GetUserDetailUseCase {
    private var userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func execute(userId: Int, completion: @escaping (UserEntity?) -> Void) {
        guard let user = userRepository.getUser(userId: userId) else {
            completion(nil)
            return
        }
        completion(UserDtoToEntityMapper().map(user))
    }
}
