//
//  Idenitfication.swift
//  TheGame
//
//  Created by Alexey Solop on 08.11.2023.
//

import Foundation
import CryptoKit

protocol AuthenticationProtocol {
    var name: String { get }
    var password: String { get }
    var isNew: Bool { get }
    
    func getHash(_ string: String) -> (String)
}
