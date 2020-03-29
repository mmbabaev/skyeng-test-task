//
//  WordWorker.swift
//  SkyEngTask
//
//  Created by Mikhail on 27.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

protocol WordWorker {
    
    var canLoadMore: Bool { get }
    
    func loadNextPage(search: String, callback: @escaping ResultCallback<[Word]>)
    func reset()
}
