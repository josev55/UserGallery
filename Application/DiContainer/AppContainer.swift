//
//  AppContainer.swift
//  UserGallery
//
//  Created by Jose Vildosola on 24-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

final class AppContainer {
    func makeUserContainer() -> UserContainer {
        let config = ApiDataNetworkConfig(baseURL: URL(string: "https://jsonplaceholder.typicode.com")!)
        let dependencies = UserContainer.Dependencies(serviceClient: DefaultServiceClient(config: config))
        return UserContainer(dependencies: dependencies)
    }
}
