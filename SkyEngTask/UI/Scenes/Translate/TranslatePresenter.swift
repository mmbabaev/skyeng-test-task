//
//  TranslatePresenter.swift
//  SkyEngTask
//
//  Created by Mihail on 28.03.2020.
//  Copyright © 2020 Mihail. All rights reserved.
//

protocol TranslatePresenter: AnyObject {
    
    func refresh(text: String)
    func loadMore(text: String)
}

final class TranslatePresenterImp {
    
    // MARK: - Properties
    
    unowned let view: TranslateView
    let worker: WordWorker
    
    // MARK: - Init
    
    init(view: TranslateView, worker: WordWorker) {
        self.view = view
        self.worker = worker
    }
}

// MARK: - TranslatePresenter

extension TranslatePresenterImp: TranslatePresenter {
    
    func refresh(text: String) {
        worker.reset()
        loadMore(text: text)
    }
    
    func loadMore(text: String) {
        worker.loadNextPage(search: text) { result in
            
        }
    }
}
