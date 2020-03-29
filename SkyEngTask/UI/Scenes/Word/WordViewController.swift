//
//  WordViewController.swift
//  SkyEngTask
//
//  Created by Mihail on 29.03.2020.
//  Copyright © 2020 Mihail. All rights reserved.
//

import UIKit

protocol WordView: AnyObject {
    
    func displayWord(text: String,
                     translate: String,
                     imageUrl: String?)
}

final class WordViewController: UIViewController {
    
    // MARK: - Properties
    
    
    
    var presenter: WordPresenter!
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.showWord()
    }
}

extension WordViewController: WordView {
    
    func displayWord(text: String,
                     translate: String,
                     imageUrl: String?) {
        
    }
}
