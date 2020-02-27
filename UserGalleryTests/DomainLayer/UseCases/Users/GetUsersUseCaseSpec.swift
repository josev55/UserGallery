//
//  GetUsersUseCaseSpec.swift
//  UserGalleryTests
//
//  Created by Jose Vildosola on 27-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import XCTest
@testable import UserGallery

class GetUsersUseCaseSpec: XCTestCase {
    var successUserRepository: UserRepository!
    var failureUserRepository: UserRepository!
    
    override func setUp() {
        successUserRepository = DefaultUserRepository(serviceClient: ServiceClientSuccessMock())
        failureUserRepository = DefaultUserRepository(serviceClient: ServiceClientFailureMock())
    }
    
    func testGetUsersSuccess() {
        let expectation = XCTestExpectation(description: "Get users use case succeeds")
        let getUserUseCase = DefaultGetUsersUseCase(userRepository: successUserRepository)
        
        getUserUseCase.execute { (entity, error) in
            XCTAssert(!entity!.isEmpty)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
        
    }
    
    func testGetUsersFailure() {
        let expectation = XCTestExpectation(description: "Get users use case fails")
        let getUserUseCase = DefaultGetUsersUseCase(userRepository: failureUserRepository)
        
        getUserUseCase.execute { (_, error) in
            XCTAssertNotNil(error)
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }

}
