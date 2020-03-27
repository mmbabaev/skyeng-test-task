//
//  Word.swift
//  SkyEngTask
//
//  Created by Mihail on 27.03.2020.
//  Copyright © 2020 Mihail. All rights reserved.
//

struct Word: Decodable {
    
    let id: Int
    let text: String
    let meanings: [Meaning]
}
