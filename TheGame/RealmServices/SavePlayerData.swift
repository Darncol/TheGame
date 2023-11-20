//
//  Player.swift
//  TheGame
//
//  Created by Alexey Solop on 08.11.2023.
//

import Foundation
import RealmSwift

final class SavePlayerData: Object {

    @Persisted(primaryKey: true) var id: String
    @Persisted var name: String
    @Persisted var exp: Int
    @Persisted var money: Int
    @Persisted var point: Int

    @Persisted var health: Int
    @Persisted var strenght: Int
    @Persisted var accuracy: Int
    @Persisted var stamina: Int

    @Persisted var items: List<SaveItem>
    
    @Persisted var coordinatesY: Int
    @Persisted var coordinatesX: Int
    
    required override init() {
        super.init()
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
        self.id = sha256Hash(from: name)
    }
}

final class SaveItem: Object {
   @Persisted var name: String
   @Persisted var durability: Int
    
   required override init() {
       super.init()
    }
    
    convenience init(name: String, durability: Int) {
        self.init()
        self.name = name
        self.durability = durability
    }
    
}

