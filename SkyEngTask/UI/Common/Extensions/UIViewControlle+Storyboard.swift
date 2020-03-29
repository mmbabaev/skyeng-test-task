//
//  UIViewController+Storyboard.swift
//  SkyEngTask
//
//  Created by Mikhail on 12/03/2019.
//  Copyright © 2019 SwappyTeam. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static var storyboardId: String {
        return String(describing: self)
    }
    
    static var storyboardName: String {
        return storyboardId.replacingOccurrences(of: "ViewController", with: "")
    }
}

extension UIStoryboard {
    
    static func createViewController<VC: UIViewController>(storyboardName: String = VC.storyboardName,
                                                           storyboardId: String = VC.storyboardId) -> VC {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: storyboardId)
        return controller as! VC
    }
}
