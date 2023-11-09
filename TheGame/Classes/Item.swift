//
//  Item.swift
//  TheGame
//
//  Created by Alexey Solop on 09.11.2023.
//

import Foundation
import RealmSwift

class Item: Object, ItemProtocol {
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
