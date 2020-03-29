//
//  TranslateRouter.swift
//  SkyEngTask
//
//  Created by Mihail on 29.03.2020.
//  Copyright © 2020 Mihail. All rights reserved.
//

import UIKit

protocol TranslateRouter {
    
    func routeToWord(_ word: Word)
}

final class TranslateRouterImp: Router {
    
}

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
