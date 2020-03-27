//
//  WordWorkerImp.swift
//  SkyEngTask
//
//  Created by Mihail on 27.03.2020.
//  Copyright © 2020 Mihail. All rights reserved.
//

struct Pager {
    var currentPage: Int
    
    
}

final class WordWorkerImp {
    
    // MARK: - Properties
    
    let pageSize = 10
    
    let service: WordService
    
    var currentPage = 0
    var isEnded = false
    var currentRequest: NetworkRequest?
    
    // MARK: - Init

    init(service: WordService) {
        self.service = service
    }
}

// MARK: - WordWorker

extension WordWorkerImp: WordWorker {
    
    func loadNextPage(search: String, callback: (Result<[Word]>) -> Void) {
        guard
        currentRequest = service.search(search, page: currentPage, pageSize: pageSize) { [weak self] result in
            switch result {
            case .success(let words):
                self?.success
                callback(.success(words))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
    
    func reset() {
        currentPage = 0
        isEnded = false
    }
}

// MARK: - Private

private extension WordWorkerImp {
    
    func incrementPage() {
        currentPage = currentPage + 1
    }
}

