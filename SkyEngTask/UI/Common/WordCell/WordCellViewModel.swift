//
//  WordCellViewModel.swift
//  SkyEngTask
//
//  Created by Mikhail on 28.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

struct WordCellViewModel {
    
    let text: String
    
    init(word: Word) {
        text = word.text
    }
}
