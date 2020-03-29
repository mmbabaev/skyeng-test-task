//
//  UITableViewCell+ImageLoader.swift
//  SkyEngTask
//
//  Created by Mihail on 30.03.2020.
//  Copyright © 2020 Mihail. All rights reserved.
//

import UIKit
import AlamofireImage


extension UIImageView {
    
    func loadImage(urlString: String?) {
        guard var urlString = urlString else { return }
        
        if urlString.starts(with: "//") {
            urlString = "https:" + urlString
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        af.setImage(withURL: url)
    }
    
    func cancelImageRequest() {
        af.cancelImageRequest()
    }
}
