//
//  WordAssembly.swift
//  SkyEngTask
//
//  Created by Mikhail on 29.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

import Swinject

final class WordAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(WordPresenter.self) { (resolver, viewController: WordViewController, input: WordInput) in
            WordPresenterImp(
                view: viewController,
                input: input
            )
        }
        
        container.register(WordViewController.self) { (resolver, input: WordInput) in
            let vc: WordViewController = UIStoryboard.createViewController()
            vc.presenter = resolver.resolve(WordPresenter.self, arguments: vc, input)
            return vc
        }
    }
}
