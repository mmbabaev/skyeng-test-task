//
//  WordPresenter.swift
//  SkyEngTask
//
//  Created by Mikhail on 29.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

struct WordInput {
    let word: Word
}

protocol WordPresenter {
    
    func showWord()
}

final class WordPresenterImp {
    
    // MARK: - Properties
    
    unowned let view: WordView
    let word: Word
    
    // MARK: - Init
    
    init(view: WordView,
         input: WordInput) {
        self.view = view
        self.word = input.word
    }
}

// MARK: - WordPresenter

extension WordPresenterImp: WordPresenter {
    
    func showWord() {
        let meaning = word.meanings.first
        let translate = meaning?.tranlationText ?? ""
        let imageUrl = meaning?.imageUrl
         
        view.displayWord(
            text: word.text,
            translate: translate,
            imageUrl: imageUrl
        )
    }
}
