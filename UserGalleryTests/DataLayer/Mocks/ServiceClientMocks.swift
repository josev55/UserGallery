//
//  ServiceClientMocks.swift
//  UserGalleryTests
//
//  Created by Jose Vildosola on 26-02-20.
//  Copyright © 2020 Jose Vildosola. All rights reserved.
//

import Foundation
@testable import UserGallery

class ServiceClientSuccessMock: ServiceClient {
    func request<T>(with endpoint: Endpoint, completion: @escaping (ServiceStatus<T>) -> Void) -> URLSessionDataTask where T : Decodable {
        completion(.success(nil))
        return URLSessionDataTask()
    }
}

class ServiceClientFailureMock: ServiceClient {
    func request<T>(with endpoint: Endpoint, completion: @escaping (ServiceStatus<T>) -> Void) -> URLSessionDataTask where T : Decodable {
        completion(.failure(.generic(NSError(domain: "", code: -1, userInfo: nil))))
        return URLSessionDataTask()
    }
}
