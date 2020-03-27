//
//  NetworkManager.swift
//  SkyEngTask
//
//  Created by Mihail on 27.03.2020.
//  Copyright © 2020 Mihail. All rights reserved.
//

import Foundation

protocol NetworkRequest {
    func cancel() -> Self
}

protocol NetworkManager {

    @discardableResult
    func request<T>(_ url: String, parameters: [String : Any], callback: @escaping (Result<T>) -> Void) -> NetworkRequest? where T : Decodable
}

extension NetworkManager {
    
    @discardableResult
    func request<T: Decodable>(
        _ url: String,
        callback: @escaping (Result<T>) -> Void
    ) -> NetworkRequest? {
        return request(url, parameters: [:], callback: callback)
    }
}
