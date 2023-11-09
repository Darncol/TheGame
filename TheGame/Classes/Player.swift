//
//  Player.swift
//  TheGame
//
//  Created by Alexey Solop on 08.11.2023.
//

import Foundation
import RealmSwift

final class Player: Object, PlayerProtocol, PlayerStatsProtocol, PlayerInventoryProtocol, PlayerlocationProtocol {
    
    @Persisted(primaryKey: true) var id: String
    @Persisted var name: String
    @Persisted var exp: Int
    @Persisted var money: Int

    @Persisted var health: Int
    @Persisted var strenght: Int
    @Persisted var accuracy: Int
    @Persisted var stamina: Int

    @Persisted var items: List<Item>
    @Persisted var location: Map
    
    required override init() {
        super.init()
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
        self.id = sha256Hash(from: name)
    }
}



