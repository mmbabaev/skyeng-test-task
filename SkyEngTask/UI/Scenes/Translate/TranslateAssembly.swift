//
//  TranslateAssembly.swift
//  SkyEngTask
//
//  Created by Mihail on 29.03.2020.
//  Copyright © 2020 Mihail. All rights reserved.
//

import Swinject

final class TranslateAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(TranslateRouter.self) { (_, viewController: TranslateViewController) in
            TranslateRouterImp(viewController: viewController)
        }
        
        container.register(TranslatePresenter.self) { (resolver, viewController: TranslateViewController) in
            TranslatePresenterImp(
                view: viewController,
                router: resolver.resolve(TranslateRouter.self, argument: viewController)!,
                worker: resolver.resolve(WordWorker.self)!
            )
        }
        
        container.register(TranslateViewController.self) { resolver in
            let vc: TranslateViewController = UIStoryboard.createViewController()
            vc.presenter = resolver.resolve(TranslatePresenter.self, argument: vc)
            return vc
        }
    }
}
