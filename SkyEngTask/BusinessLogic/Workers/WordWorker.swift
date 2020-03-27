//
//  WordWorker.swift
//  SkyEngTask
//
//  Created by Mihail on 27.03.2020.
//  Copyright © 2020 Mihail. All rights reserved.
//

protocol WordWorker {
    
    func loadNextPage(search: String, callback: ResultCallback<[Word]>)
    func reset()
}
