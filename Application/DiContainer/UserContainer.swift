//
//  UserContainer.swift
//  UserGallery
//
//  Created by Jose Vildosola on 24-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import UIKit

final class UserContainer {
    struct Dependencies {
        let serviceClient: ServiceClient
    }
    
    private let dependencies: Dependencies
    private var userRepository: UserRepository
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        self.userRepository = DefaultUserRepository(serviceClient: dependencies.serviceClient)
    }
    
    func makeUserRepository() -> UserRepository {
        return userRepository
    }
    
    func makeGetUsersUseCase() -> GetUsersUseCase {
        return DefaultGetUsersUseCase(userRepository: makeUserRepository())
    }
    
    func makeUserListPresenter() -> UserListPresenter {
        return DefaultUserListPresenter(getUsersUseCase: makeGetUsersUseCase())
    }
    
    func makeUserListViewController() -> UserListViewController {
        return UserListViewController.create(presenter: makeUserListPresenter(), makeUserDetailFactory: self)
    }
    
    func makeGetUserDetailUseCase() -> GetUserDetailUseCase {
        return DefaultGetUserDetailUseCase(userRepository: makeUserRepository())
    }
    
    func makeUserDetailPresenter() -> UserDetailPresenter {
        return DefaultUserDetailPresenter(getUserDetailUseCase: makeGetUserDetailUseCase())
    }
    
    func makeUserDetailViewController(userId: Int) -> UIViewController {
        let vc = UserDetailViewController.create(userId: userId, userDetailPresenter: makeUserDetailPresenter())
        return vc
    }
}

extension UserContainer: MakeUserListViewControllerFactory {}
