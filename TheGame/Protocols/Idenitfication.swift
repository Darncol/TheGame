//
//  Idenitfication.swift
//  TheGame
//
//  Created by Alexey Solop on 08.11.2023.
//

import Foundation

protocol Identification {
    var name: String { get }
    var password: String { get }
    var isValid: Bool { get }
}
