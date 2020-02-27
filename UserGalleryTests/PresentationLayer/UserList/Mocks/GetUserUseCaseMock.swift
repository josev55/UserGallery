//
//  GetUserUseCaseMock.swift
//  UserGalleryTests
//
//  Created by Jose Vildosola on 27-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation
@testable import UserGallery

class GetUserUseCaseSuccessMock: GetUsersUseCase {
    func execute(completion: @escaping ([UserEntity]?, Error?) -> Void) {
        completion([UserEntity(id: 0, name: "", username: "", email: "", address: AddressEntity(street: "", suite: "", city: "", zipcode: "", geo: (lat: 0.1, lng: 0.2)), phone: "", website: "", company: CompanyEntity(name: "", catchPhrase: "", bs: ""))], nil)
    }
}

class GetUserUseCaseFailureMock: GetUsersUseCase {
    func execute(completion: @escaping ([UserEntity]?, Error?) -> Void) {
        completion(nil, NSError(domain: "", code: 0, userInfo: nil))
    }
}
