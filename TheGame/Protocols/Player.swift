//
//  Player.swift
//  TheGame
//
//  Created by Alexey Solop on 08.11.2023.
//

import Foundation

protocol PlayerProtocol {
    var name: String { get }
    var password: String { get }
    var exp: Int { get set }
    var money: Int { get set }
}

protocol PlayerStatsProtocol {
    var health: Int { get set }
    var strenght: Int { get set }
    var accuracy: Int { get set }
    var stamina: Int { get set }
}

protocol PlayerInventory {
    var items: [ItemProtocol] { get set }
}