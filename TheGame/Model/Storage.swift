//
//  Storage.swift
//  TheGame
//
//  Created by Alexey Solop on 08.11.2023.
//

import Foundation
import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func savePlayerData(_ player: Player) {
        try! realm.write{
            realm.add(player)
        }
    }
    
    static func deletePlayer(_ player: Player) {
        try! realm.write{
            realm.delete(player)
        }
    }
}
