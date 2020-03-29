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
    func selectWord(at index: Int)
}

final class TranslatePresenterImp {
    
    // MARK: - Properties
    
    unowned let view: TranslateView
    let router: TranslateRouter
    let worker: WordWorker
    
    private var words = [Word]()
    
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
            switch result {
            case .success(let newWords):
                self?.didLoadNewWords(newWords)
            case .failure:
                self?.view.displayError()
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
}
