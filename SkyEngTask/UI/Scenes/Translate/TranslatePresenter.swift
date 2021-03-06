//
//  TranslatePresenter.swift
//  SkyEngTask
//
//  Created by Mikhail on 28.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

protocol TranslatePresenter: AnyObject {
    
    func refresh(text: String)
    func loadMore(text: String)
    func selectWord(at index: Int)
}

final class TranslatePresenterImp {
    
    // MARK: - Properties
    
    unowned let view: TranslateView
    let router: TranslateRouter
    let worker: WordWorker
    
    var words = [Word]()
    
    // MARK: - Init
    
    init(view: TranslateView,
         router: TranslateRouter,
         worker: WordWorker) {
        self.view = view
        self.router = router
        self.worker = worker
    }
}

// MARK: - TranslatePresenter

extension TranslatePresenterImp: TranslatePresenter {
    
    func refresh(text: String) {
        words = []
        worker.reset()
        loadMore(text: text)
    }
    
    func loadMore(text: String) {
        worker.loadNextPage(search: text) { [weak self] result in
            self?.view.endLoading()
            
            switch result {
            case .success(let newWords):
                self?.didLoadNewWords(newWords)
            case .failure(let error):
                self?.handleLoadError(error)
            }
        }
    }
    
    func selectWord(at index: Int) {
        guard let word = words[safe: index] else { return }
        
        router.routeToWord(word)
    }
}

// MARK: - Private

private extension TranslatePresenterImp {
    
    func didLoadNewWords(_ newWords: [Word]) {
        words.append(contentsOf: newWords)
        
        let cellModels = words.map { WordCellViewModel(word: $0) }
        view.displayCells(cellModels)
    }
    
    func handleLoadError(_ error: AppError) {
        guard error != .cancelled else {
            return
        }
        
        view.displayError()
    }
}
