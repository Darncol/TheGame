//
//  Storage.swift
//  TheGame
//
//  Created by Alexey Solop on 08.11.2023.
//

import Foundation
import RealmSwift

final class RealmService {
     private var realm: Realm?
    
    init() {
        do {
            realm = try Realm()
        } catch {
            print("Ошибка инициализации Realm: \(error)")
        }
    }
    
     func savePlayer(_ player: Player) {
         let savedPlayerData = SavePlayerData(
            name: player.name,
            exp: player.exp,
            money: player.money,
            point: player.point,
            health: player.health,
            strenght: player.strenght,
            accuracy: player.accuracy,
            stamina: player.stamina,
            coordinates: player.coordinates
         )
         
        do {
            try realm?.write {
                realm?.add(savedPlayerData)
            }
        } catch {
            print("Ошибка при добавлении объекта: \(error)")
        }
    }
    
    func loadPlayer(name: String) -> Player? {
        let playerID = sha256Hash(from: name)
        
        if let loadedPlayerData = realm?.object(ofType: SavePlayerData.self, forPrimaryKey: playerID) {
            let player = Player(
                name: loadedPlayerData.name,
                exp: loadedPlayerData.exp,
                money: loadedPlayerData.money,
                point: loadedPlayerData.point,
                health: loadedPlayerData.health,
                strenght: loadedPlayerData.strenght,
                accuracy: loadedPlayerData.accuracy,
                stamina: loadedPlayerData.stamina,
                coordinates: (loadedPlayerData.coordinatesY, loadedPlayerData.coordinatesX)
            )
            return player
        } else {
            print("Игрок с именем \(name) не найден.")
            return nil
        }
    }

}


