//
//  Collection+SafeSubscription.swift
//  Swappy
//
//  Created by Бабаев Михаил Михайлович on 08/03/2019.
//  Copyright © 2019 SwappyTeam. All rights reserved.
//

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
