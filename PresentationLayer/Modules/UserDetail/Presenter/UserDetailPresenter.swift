//
//  UserDetailPresenter.swift
//  UserGallery
//
//  Created by Jose Vildosola on 25-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

protocol UserDetailPresenter {
    var view: UserDetailView! { get set }
    func getUserDetail(userId: Int)
}

class DefaultUserDetailPresenter: UserDetailPresenter {
    var view: UserDetailView!
    
    private var getUserDetailUseCase: GetUserDetailUseCase
    private var getAlbumsUseCase: GetAlbumsUseCase
    
    init(getUserDetailUseCase: GetUserDetailUseCase, getAlbumsUseCase: GetAlbumsUseCase) {
        self.getUserDetailUseCase = getUserDetailUseCase
        self.getAlbumsUseCase = getAlbumsUseCase
    }
    
    func getUserDetail(userId: Int) {
        getUserDetailUseCase.execute(userId: userId) { (userEntity) in
            if let user = userEntity {
                self.view.setUser(model: UserDetailEntityToViewModelMapper().map(user))
            }
        }
    }
}
