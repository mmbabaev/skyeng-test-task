//
//  WordViewController.swift
//  SkyEngTask
//
//  Created by Mikhail on 29.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

import UIKit

protocol WordView: AnyObject {
    
    func displayWord(text: String,
                     translate: String,
                     imageUrl: String?)
}

final class WordViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var translateLabel: UILabel!
    
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
        textLabel.text = text
        translateLabel.text = translate
    }
}
