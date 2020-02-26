//
//  Mapper.swift
//  UserGallery
//
//  Created by Jose Vildosola on 24-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation

protocol Mapper {
    associatedtype FROM
    associatedtype TO
    
    func map(_ from: FROM) -> TO
}
