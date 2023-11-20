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
               self.realm = try Realm()
           } catch {
               print("Ошибка инициализации Realm: \(error)")
           }
       }

       func addObject(_ object: Object) {
           do {
               try realm?.write {
                   realm?.add(object)
               }
           } catch {
               print("Ошибка при добавлении объекта: \(error)")
           }
       }
}


