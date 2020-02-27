//
//  GetUserDetailUseCaseSpec.swift
//  UserGalleryTests
//
//  Created by Jose Vildosola on 27-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import XCTest
@testable import UserGallery

class GetUserDetailUseCaseSpec: XCTestCase {
    var successUserRepository: UserRepository!
    var failureUserRepository: UserRepository!
    let mockUser = UserDTO(id: 0, name: "J", username: "JV", email: "j@v.cl", address: AddressDTO(street: "", suite: "", city: "", zipcode: "", geo: GeoDTO(lat: "0.1", lng: "0.2")), phone: "", website: "", company: CompanyDTO(name: "", catchPhrase: "", bs: ""))
    
    override func setUp() {
        successUserRepository = DefaultUserRepository(serviceClient: ServiceClientSuccessMock())
        failureUserRepository = DefaultUserRepository(serviceClient: ServiceClientFailureMock())
    }
    
    func testGetUserDetailSuccess() {
        let expectation = XCTestExpectation(description: "Get user detail succeeds")
        let getUserDetailUseCase = DefaultGetUserDetailUseCase(userRepository: successUserRepository)
        successUserRepository.users = [mockUser]
        
        getUserDetailUseCase.execute(userId: 0) { (entity) in
            XCTAssertNotNil(entity)
            XCTAssert(entity?.name == "J")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testGetUserDetailFailure() {
        let expectation = XCTestExpectation(description: "Get user detail fails")
        let getUserDetailUseCase = DefaultGetUserDetailUseCase(userRepository: failureUserRepository)
        
        getUserDetailUseCase.execute(userId: 0) { (entity) in
            XCTAssertNil(entity)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
