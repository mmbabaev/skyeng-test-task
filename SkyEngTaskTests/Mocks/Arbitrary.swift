//
//  Arbitrary.swift
//  SkyEngTaskTests
//
//  Created by Mikhail on 28.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

@testable import SkyEngTask

enum Arbitrary {
    
    static let string = "textextext"
    static let id = 123
    static let int = 1
    
    static let word = Word(id: 0, text: "text", meanings: [])
}
