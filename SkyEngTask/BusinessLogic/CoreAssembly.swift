//
//  CoreAssembly.swift
//  SkyEngTask
//
//  Created by Mikhail on 29.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

import Swinject

final class CoreAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(NetworkManager.self) { _ in
            NetworkManagerImp()
        }
        
        container.register(WordService.self) { resolver in
            WordServiceImp(
                network: resolver.resolve(NetworkManager.self)!
            )
        }
        
        container.register(WordWorker.self) { resolver in
            WordWorkerImp(
                service: resolver.resolve(WordService.self)!
            )
        }
    }
}
