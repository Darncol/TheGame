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
    
    @Persisted var coordinatesY: Int
    @Persisted var coordinatesX: Int
    
    required override init() {
        super.init()
    }
    
    convenience init(name: String, exp: Int, money: Int, point: Int, health: Int, strenght: Int, accuracy: Int, stamina: Int, coordinates: (Int, Int)) {
        self.init()
        self.name = name
        self.exp = exp
        self.money = money
        self.point = point
        self.health = health
        self.strenght = strenght
        self.accuracy = accuracy
        self.stamina = stamina
        self.coordinatesY = coordinates.0
        self.coordinatesX = coordinates.1
        self.id = sha256Hash(from: name)
    }
}


