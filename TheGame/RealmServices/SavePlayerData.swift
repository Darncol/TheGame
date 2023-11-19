//
//  Player.swift
//  TheGame
//
//  Created by Alexey Solop on 08.11.2023.
//

import Foundation
import RealmSwift

// MARK: Додумать как связать протоколы и realm

final class SavePlayerData: Object {

    @Persisted(primaryKey: true) var id: String
    @Persisted private(set) var name: String
    @Persisted private(set) var exp: Int
    @Persisted private(set) var money: Int
    @Persisted private(set) var point: Int

    @Persisted private(set) var health: Int
    @Persisted private(set) var strenght: Int
    @Persisted private(set) var accuracy: Int
    @Persisted private(set) var stamina: Int

    @Persisted private(set) var items: List<SaveItem>
    
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
   @Persisted private(set) var name: String
   @Persisted private(set) var durability: Int
    
   required override init() {
       super.init()
    }
    
    convenience init(name: String, durability: Int) {
        self.init()
        self.name = name
        self.durability = durability
    }
    
}

