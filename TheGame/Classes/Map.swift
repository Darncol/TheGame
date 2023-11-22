//
//  MapHandler.swift
//  TheGame
//
//  Created by Alexey Solop on 21.11.2023.
//

import Foundation

class Map {
    static let shared = Map()
    
    private let mapMatrix = [
        [1,2,3],
        [4,5,6],
        [7,8,9],
        [10,11,12]
    ]
    
    private var locationNames: [Int: String] {
        [
            1: "Волшебный Предел",
            2: "Промежуток Времени",
            3: "Лунные Вершины",
            4: "Долина Драконов",
            5: "Гавань Приключений",
            6: "Убежище Зверей",
            7: "Воронка Водоворота",
            8: "Торговый Рейд",
            9: "Лесные Развалины",
            10: "Оплот Дракона",
            11: "Мельница на Реке",
            12: "Зеленый Покой"
        ]
    }
    
    func getLocationName(byCoordinates coordinates: (y: Int, x: Int)) -> String {
        guard coordinates.y >= 0, coordinates.y < mapMatrix.count,
              coordinates.x >= 0, coordinates.x < mapMatrix[coordinates.y].count else {
            return "Неизведанная Территория?"
        }
        return locationNames[getIndex(fromY: coordinates.y, andX: coordinates.x)] ?? "Неизведанная Территория?"
    }
    
    func getIndex(fromY coordinateY: Int, andX coordinateX: Int) -> Int {
        mapMatrix[coordinateY][coordinateX]
    }
}
