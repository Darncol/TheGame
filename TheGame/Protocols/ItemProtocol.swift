//
//  Item.swift
//  TheGame
//
//  Created by Alexey Solop on 08.11.2023.
//

import Foundation

protocol ItemProtocol {
    var name: String { get }
    var durability: Int { get set }
}

protocol WeaponProtocol {
    var damage: Int { get }
}

protocol ArmorProtocol {
    var defence: Int { get }
}
