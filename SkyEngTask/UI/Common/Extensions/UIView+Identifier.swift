//
//  UITableViewCell+Identifier.swift
//  SkyEngTask
//
//  Created by Mihail on 28.03.2020.
//  Copyright © 2020 Mihail. All rights reserved.
//

import UIKit

extension UIView {

    // MARK: - Properties

    @nonobjc static var reuseIdentifier: String {
        return String(describing: self)
    }

    @nonobjc static var nibName: String {
        return String(describing: self)
    }
}
