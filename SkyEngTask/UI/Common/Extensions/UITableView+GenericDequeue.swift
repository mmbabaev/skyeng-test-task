
//
//  UITableView+GenericDequeue.swift
//  Swappy
//
//  Created by Mihail on 12/05/2019.
//  Copyright © 2019 SwappyTeam. All rights reserved.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        if let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T {
            return cell
        } else {
            return T()
        }
    }
    
    func register<T: UITableViewCell>(cellType: T.Type) {
        self.register(UINib(nibName: T.nibName, bundle: nil), forCellReuseIdentifier: T.reuseIdentifier)
    }
}
