//
//  UserRepository.swift
//  UserGallery
//
//  Created by Jose Vildosola on 24-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

protocol UserRepository {
    var users: [UserDTO]? { get set }
    
    @discardableResult
    func getUsers(completion: @escaping (ServiceStatus<[UserDTO]>) -> Void) -> URLSessionDataTask
    
    func getUser(userId: Int) -> UserDTO?
}
