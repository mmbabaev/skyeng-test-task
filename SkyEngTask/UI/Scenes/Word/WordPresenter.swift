//
//  WordPresenter.swift
//  SkyEngTask
//
//  Created by Mihail on 29.03.2020.
//  Copyright © 2020 Mihail. All rights reserved.
//

struct WordInput {
    let word: Word
}

protocol WordPresenter {
    
    func showWord()
}

final class WordPresenterImp {
    
    unowned let view: WordView
    let word: Word
    
    init(view: WordView,
         input: WordInput) {
        self.view = view
        self.word = input.word
    }
}

extension WordPresenterImp: WordPresenter {
    
    func showWord() {
        
    }
}
