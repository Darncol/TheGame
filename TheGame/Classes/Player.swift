//
//  Player.swift
//  TheGame
//
//  Created by Alexey Solop on 15.11.2023.
//

import Foundation

final class Player: PlayerProtocol, PlayerStatsProtocol, MapProtocol {
    
    private(set) var name: String
    private(set) var password: String
    private(set) var exp: Int
    private(set) var money: Int
    private(set) var point: Int
    
    private(set) var health: Int
    private(set) var strenght: Int
    private(set) var accuracy: Int
    private(set) var stamina: Int
    
    private(set) var coordinates: (y: Int, x: Int)
    
    init(name: String, password: String, exp: Int, money: Int, point: Int, health: Int, strenght: Int, accuracy: Int, stamina: Int, coordinates: (Int, Int)) {
        self.name = name
        self.password = password
        self.exp = exp
        self.money = money
        self.point = point
        self.health = health
        self.strenght = strenght
        self.accuracy = accuracy
        self.stamina = stamina
        self.coordinates = coordinates
    }
    
    convenience init(name: String, password: String, coordinates: (Int, Int)) {
        self.init(
            name: name, 
            password: password,
            exp: 0,
            money: 0,
            point: 2,
            health: 10,
            strenght: 1,
            accuracy: 1,
            stamina: 1,
            coordinates: coordinates
        )
        
    }
    
    func moveToNew(destination coordinate: Int) {
        coordinates.y = (coordinate - 1) / 3
        coordinates.x = (coordinate - 1) % 3
    }
}


