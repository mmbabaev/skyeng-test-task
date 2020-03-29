//
//  TranslateRouter.swift
//  SkyEngTask
//
//  Created by Mikhail on 29.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

import UIKit

protocol TranslateRouter {
    
    func routeToWord(_ word: Word)
}

final class TranslateRouterImp {
    
    // MARK: - Properties
    
    unowned let viewController: UIViewController
    let resolver = ApplicationAssembly.resolver
    
    // MARK: - Init
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

// MARK: - TranslateRouter

extension TranslateRouterImp: TranslateRouter {
    
    func routeToWord(_ word: Word) {
        let input = WordInput(word: word)
        guard let wordVC = resolver.resolve(WordViewController.self, argument: input) else {
            return
        }
        
        let navigationController = viewController.navigationController
        navigationController?.pushViewController(wordVC, animated: true)
    }
}
