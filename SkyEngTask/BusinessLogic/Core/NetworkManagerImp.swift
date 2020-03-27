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
            .responseDecodable(of: T.self) { response in
                
            guard let value = response.value else {
                // TODO: handle errors
                callback(.failure(.network))
                return
            }
            
            callback(.success(value))
        }
    }
}


extension DataRequest: NetworkRequest {
    func cancelRequest() {
        self.cancel()
    }
}
