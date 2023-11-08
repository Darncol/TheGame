//
//  Player.swift
//  TheGame
//
//  Created by Alexey Solop on 08.11.2023.
//

import Foundation
import RealmSwift

class Player: Object {
    @objc dynamic var name: String
    
    init(name: String) {
        self.name = name
    }
}
