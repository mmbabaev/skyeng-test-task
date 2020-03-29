//
//  NetworkManagerImp.swift
//  SkyEngTask
//
//  Created by Mihail on 27.03.2020.
//  Copyright © 2020 Mihail. All rights reserved.
//

import Alamofire

final class NetworkManagerImp {
    
    
}

extension NetworkManagerImp: NetworkManager {
    
    func request<T>(_ url: String, parameters: [String : Any], callback: @escaping (Result<T>) -> Void) -> NetworkRequest? where T : Decodable {
        
        AF.request(url, parameters: parameters)
            .validate()
            .responseDecodable(of: T.self) { [weak self] response in
            guard let value = response.value else {
                // TODO: handle errors
                let error = self?.appError(from: response.error) ?? .unknown
                callback(.failure(error))
                return
            }
            
            callback(.success(value))
        }
    }
}

private extension NetworkManagerImp {
    
    
    func appError(from afError: AFError?) -> AppError {
        guard let afError = afError else {
            return .unknown
        }
        
        switch afError {
        case .explicitlyCancelled:
            return .cancelled
        default:
            return .network
        }
    }
}


extension DataRequest: NetworkRequest {
    func cancelRequest() {
        self.cancel()
    }
}
