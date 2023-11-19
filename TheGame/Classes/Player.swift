//
//  Player.swift
//  TheGame
//
//  Created by Alexey Solop on 15.11.2023.
//

import Foundation

class Player: PlayerProtocol, PlayerStatsProtocol, PlayerInventoryProtocol, MapProtocol {
    
   private(set) var name: String
   private(set) var exp: Int
   private(set) var money: Int
   private(set) var point: Int
    
   private(set) var health: Int
   private(set) var strenght: Int
   private(set) var accuracy: Int
   private(set) var stamina: Int
    
   private(set) var items: [ItemProtocol]
    
   private(set) var coordinates: (y: Int, x: Int)
    
    init(name: String, exp: Int, money: Int, point: Int, health: Int, strenght: Int, accuracy: Int, stamina: Int, items: [ItemProtocol], coordinates: (Int, Int)) {
        self.name = name
        self.exp = exp
        self.money = money
        self.point = point
        self.health = health
        self.strenght = strenght
        self.accuracy = accuracy
        self.stamina = stamina
        self.items = items
        self.coordinates = coordinates
    }
    
    convenience init(name: String, coordinates: (Int, Int)) {
        self.init(
            name: name,
            exp: 0,
            money: 0,
            point: 2,
            health: 10,
            strenght: 1,
            accuracy: 1,
            stamina: 1,
            items: [],
            coordinates: coordinates
        )
        
    }
    
    func moveToNew(destination coordinate: Int) {
        coordinates.y = Int((Double(coordinate) / 3.0).rounded(.up)) - 1
        coordinates.x = (coordinate % 3) - 1
    }
    
}


