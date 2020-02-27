//
//  NetworkConfigurableSpec.swift
//  UserGalleryTests
//
//  Created by Jose Vildosola on 26-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import XCTest
@testable import UserGallery

class NetworkConfigurableSpec: XCTestCase {
    
    override func setUp() {
    }
    
    func testConstructor() {
        let result = ApiDataNetworkConfig(baseURL: URL(string: "http://sometext.com")!, headers: [:], queryParameters: [:])
        
        XCTAssert(result.baseURL.absoluteString == "http://sometext.com")
        XCTAssert(result.headers == [:])
        XCTAssert(result.queryParameters == [:])
    }
}
