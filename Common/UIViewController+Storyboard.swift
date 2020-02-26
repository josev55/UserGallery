//
//  UIViewController+Storyboard.swift
//  UserGallery
//
//  Created by Jose Vildosola on 24-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import UIKit

extension UIViewController {
    class var storyboardId: String {
        return "\(self)"
    }

    static func instantiate(from appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}
