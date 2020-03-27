//
//  WordService.swift
//  SkyEngTask
//
//  Created by Mihail on 27.03.2020.
//  Copyright © 2020 Mihail. All rights reserved.
//

protocol WordService {
    
    func search(_ search: String,
                page: Int,
                pageSize: Int,
                callback: @escaping ResultCallback<[Word]>)
}
