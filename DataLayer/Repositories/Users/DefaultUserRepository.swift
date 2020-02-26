//
//  DefaultUserRepository.swift
//  UserGallery
//
//  Created by Jose Vildosola on 24-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

final class DefaultUserRepository {
    private var serviceClient: ServiceClient
    private var usersCache: [UserDTO]?
    
    init(serviceClient: ServiceClient) {
        self.serviceClient = serviceClient
    }
}

extension DefaultUserRepository: UserRepository {
    var users: [UserDTO]? {
        get {
            return usersCache
        }
        set {
            usersCache = newValue
        }
    }
    
    
    @discardableResult
    func getUsers(completion: @escaping (ServiceStatus<[UserDTO]>) -> Void) -> URLSessionDataTask {
        return serviceClient.request(with: APIEndpoint.getUsers(), completion: completion)
    }
    
    func getUser(userId: Int) -> UserDTO? {
        return usersCache?.filter({ (user) -> Bool in
            user.id == userId
        }).first
    }
}
