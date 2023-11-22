//
//  Authentification.swift
//  TheGame
//
//  Created by Alexey Solop on 21.11.2023.
//

import Foundation
import RealmSwift

final class AuthenticationManager {
    private let realmService: RealmService

    init(realmService: RealmService) {
        self.realmService = realmService
    }

    func authenticateUser(login: String, password: String) -> Bool {
        let id = sha256Hash(from: login)
        let securedPassword = sha256Hash(from: password)
        
        guard let player = realmService.loadPlayer(id: id), player.password == securedPassword else {
            return false
        }
        
        AuthenticationStore.shared.setID(id: id)
        return true
    }
    
    func createNewPlayer(login: String, password: String) -> Bool {
           let securedPassword = sha256Hash(from: password)

           if realmService.doesPlayerExist(name: login) {
               return false
           } else {
               let player = Player(name: login, password: securedPassword, coordinates: (0, 0))
               realmService.savePlayer(player)
               AuthenticationStore.shared.setID(id: sha256Hash(from: login))
               return true
           }
       }
}

final class AuthenticationStore {
    static let shared = AuthenticationStore()
    private(set) var id: String?

    func setID(id: String) {
        self.id = id
    }
}
