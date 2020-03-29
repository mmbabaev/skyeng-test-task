//
//  WordCellViewModel.swift
//  SkyEngTask
//
//  Created by Mihail on 28.03.2020.
//  Copyright © 2020 Mihail. All rights reserved.
//

struct WordCellViewModel {
    
    let text: String
    
    init(word: Word) {
        text = word.text
    }
}
