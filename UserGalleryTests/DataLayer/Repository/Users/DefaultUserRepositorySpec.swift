//
//  DefaultUserRepositorySpec.swift
//  UserGalleryTests
//
//  Created by Jose Vildosola on 26-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import XCTest
@testable import UserGallery

class DefaultUserRepositorySpec: XCTestCase {
    var userRepository: UserRepository!
    
    func testGetUsersSuccess() {
        userRepository = DefaultUserRepository(serviceClient: ServiceClientSuccessMock())
        
        let expectation = XCTestExpectation(description: "Repository get users succeeds")
        
        userRepository.getUsers { (status) in
            switch status {
            case .success(_):
                expectation.fulfill()
            default:
                assertionFailure()
            }
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testGetUsersFailure() {
        userRepository = DefaultUserRepository(serviceClient: ServiceClientFailureMock())
        
        let expectation = XCTestExpectation(description: "Repository get users fails")
        
        userRepository.getUsers { (status) in
            switch status {
            case .failure(_):
                expectation.fulfill()
            default:
                assertionFailure()
            }
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
