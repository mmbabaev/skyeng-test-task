//
//  Router.swift
//  SkyEngTask
//
//  Created by Mikhail on 29.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

import UIKit
import Swinject

class Router {
    
    unowned let viewController: UIViewController
    let resolver = ApplicationAssembly.resolver
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}
