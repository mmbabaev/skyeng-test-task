//
//  WordTableViewCell.swift
//  SkyEngTask
//
//  Created by Mihail on 28.03.2020.
//  Copyright © 2020 Mihail. All rights reserved.
//

import UIKit

final class WordTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var wordImageView: UIImageView!
    
    // MARK: - Functions

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with cellModel: WordCellViewModel) {
        titleLabel.text = cellModel.text
    }
}
