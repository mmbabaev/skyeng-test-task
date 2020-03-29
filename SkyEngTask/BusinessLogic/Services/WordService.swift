//
//  WordService.swift
//  SkyEngTask
//
//  Created by Mikhail on 27.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

protocol WordService {
    
    func search(_ search: String,
                page: Int,
                pageSize: Int,
                callback: @escaping ResultCallback<[Word]>) -> NetworkRequest?
}
