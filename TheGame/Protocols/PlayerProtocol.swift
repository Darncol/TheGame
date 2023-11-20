//
//  Player.swift
//  TheGame
//
//  Created by Alexey Solop on 08.11.2023.
//

import Foundation

protocol PlayerProtocol {
    var name: String { get }
    var exp: Int { get }
    var money: Int { get }
    var point: Int { get }
}

protocol PlayerStatsProtocol {
    var health: Int { get }
    var strenght: Int { get }
    var accuracy: Int { get }
    var stamina: Int { get }
}

protocol MapProtocol {
    var coordinates: (y: Int, x: Int) { get }
}
