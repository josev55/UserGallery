//
//  AppStoryboard.swift
//  UserGallery
//
//  Created by Jose Vildosola on 24-02-20.
//  Copyright © 2019 Jose Vildosola. All rights reserved.
//

import UIKit

enum AppStoryboard: String {
    case UserList, UserDetail

    private var bundle: Bundle? {
        return Bundle.main
    }

    private var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: bundle)
    }

    func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
        let storyboardID = (viewControllerClass as T.Type).storyboardId
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
}
