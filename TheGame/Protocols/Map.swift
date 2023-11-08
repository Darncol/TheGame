//
//  Map.swift
//  TheGame
//
//  Created by Alexey Solop on 08.11.2023.
//

import Foundation

protocol MapProtocol {
    var map: [[Int]] { get }
    var coordinates: (x: Int, y: Int) { get set }
}
