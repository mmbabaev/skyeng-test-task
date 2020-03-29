//
//  WordTableViewCell.swift
//  SkyEngTask
//
//  Created by Mikhail on 28.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

import UIKit

final class WordTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var wordImageView: UIImageView!
    
    // MARK: - Functions

    override func prepareForReuse() {
        super.prepareForReuse()
        
        wordImageView.cancelImageRequest()
        wordImageView.image = #imageLiteral(resourceName: "word_placeholder")
    }

    func configure(with cellModel: WordCellViewModel) {
        titleLabel.text = cellModel.text
        
        wordImageView.loadImage(urlString: cellModel.imageUrl)
    }
}
