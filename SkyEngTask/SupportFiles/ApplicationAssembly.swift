//
//  SwinjectContainer+Default.swift
//  SkyEngTask
//
//  Created by Mikhail on 29.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

import Swinject

final class ApplicationAssembly {
    
    static let assembler: Assembler = {
        let assembler = Assembler(container: Container())
        
        assembler.apply(assemblies: [
            TranslateAssembly(),
            WordAssembly(),
            
            CoreAssembly()
        ])
        
        return assembler
    }()
    
    static var resolver: Resolver {
        return assembler.resolver
    }
}
