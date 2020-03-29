//
//  WordWorkerImp.swift
//  SkyEngTask
//
//  Created by Mikhail on 27.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

final class WordWorkerImp {
    
    // MARK: - Properties
    
    let service: WordService
    
    var currentPage = 0
    var isEnded = false
    var currentRequest: NetworkRequest?
    
    let pageSize = 10
    
    // MARK: - Init

    init(service: WordService) {
        self.service = service
    }
}

// MARK: - WordWorker

extension WordWorkerImp: WordWorker {
    
    func loadNextPage(search: String, callback: @escaping (Result<[Word]>) -> Void) {
        guard !isEnded else {
            callback(.success([]))
            return
        }
        
        currentRequest?.cancelRequest()
        currentRequest = service.search(search,
                                        page: currentPage,
                                        pageSize: pageSize) { [weak self] result in
            switch result {
            case .success(let words):
                self?.successLoaded(words)
                callback(.success(words))
            case .failure(let error) where error == .cancelled:
                callback(.success([]))
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
    
    func successLoaded(_ words: [Word]) {
        currentPage = currentPage + 1
        
        if words.count < pageSize {
            isEnded = true
        }
    }
}

