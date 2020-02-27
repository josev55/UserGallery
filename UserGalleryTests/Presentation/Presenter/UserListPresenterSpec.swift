//
//  UserListPresenterSpec.swift
//  UserGalleryTests
//
//  Created by Jose Vildosola on 27-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import XCTest
@testable import UserGallery

class UserListPresenterSpec: XCTestCase {
    var userListPresenter: UserListPresenter!
    var userListViewMock: UserListViewMock!
    
    override func setUp() {
        userListViewMock = UserListViewMock()
        userListPresenter = DefaultUserListPresenter(getUsersUseCase: GetUserUseCaseSuccessMock())
        userListPresenter.view = userListViewMock
    }
    
    func testGetUsersSuccess() {
        userListPresenter.getUsers()
        XCTAssert(userListViewMock.didCallShowLoading, "Did not call show loading")
        XCTAssert(userListViewMock.didCallSetUsers, "Did not call set users")
        XCTAssert(userListViewMock.didCallHideLoading, "Did not call hide loading")
    }
}
