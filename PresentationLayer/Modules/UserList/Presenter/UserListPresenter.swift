//
//  UserListPresenter.swift
//  UserGallery
//
//  Created by Jose Vildosola on 25-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

protocol UserListPresenter {
    var view: UserListView! { get set }
    func getUsers()
}

class DefaultUserListPresenter: UserListPresenter {
    var view: UserListView!
    
    private var getUsersUseCase: GetUsersUseCase
    
    init(getUsersUseCase: GetUsersUseCase) {
        self.getUsersUseCase = getUsersUseCase
    }
    
    func getUsers() {
        self.view.showLoading()
        getUsersUseCase.execute { (userEntities, error) in
            self.view.hideLoading()
            if let _ = error {
                // TODO: MANEJAR CASO DONDE FALLA TANTO REMOTO COMO LOCAL
                debugPrint(error!)
            } else {
                self.view.setUsers(userEntities!.map({ (user) -> UserListViewModel in
                    UserEntityToViewModelMapper().map(user)
                }))
            }
        }
    }
}
