//
//  TranslateServiceImp.swift
//  SkyEngTask
//
//  Created by Mikhail on 27.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

final class WordServiceImp {
    
    // MARK: - Properties
    
    let network: NetworkManager
    
    // MARK: - Init
    
    init(network: NetworkManager) {
        self.network = network
    }
}

// MARK: - WordService

extension WordServiceImp: WordService {
    
    func search(_ search: String, page: Int, pageSize: Int, callback: @escaping ResultCallback<[Word]>) -> NetworkRequest? {
        let url = "https://dictionary.skyeng.ru/api/public/v1/words/search"
        
        let parameters: [String : Any] = [
            "search" : search,
            "page" : page,
            "pageSize": pageSize
        ]
        
        return network.request(url, parameters: parameters, callback: callback)
    }
}
