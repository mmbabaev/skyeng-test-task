//
//  Meaning.swift
//  SkyEngTask
//
//  Created by Mikhail on 27.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

struct Meaning: Decodable {
    
    private struct Translation: Decodable {
        let text: String
    }
    
    let id: Int
    let previewUrl: String?
    let imageUrl: String?
    
    private let translation: Translation
}

// MARK: - Computed properties

extension Meaning {
    
    var tranlationText: String {
        return translation.text
    }
}
