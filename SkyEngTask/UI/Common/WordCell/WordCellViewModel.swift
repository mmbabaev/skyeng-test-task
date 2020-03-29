//
//  WordCellViewModel.swift
//  SkyEngTask
//
//  Created by Mikhail on 28.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

struct WordCellViewModel {
    
    let text: String
    let imageUrl: String?
    
    init(word: Word) {
        text = word.text
        imageUrl = word.meanings.first?.previewUrl
    }
}
