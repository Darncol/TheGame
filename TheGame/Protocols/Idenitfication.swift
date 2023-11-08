//
//  Idenitfication.swift
//  TheGame
//
//  Created by Alexey Solop on 08.11.2023.
//

import Foundation
import CryptoKit

protocol IdentificationProtocol {
    var name: String { get }
    var password: String { get }
    var isNew: Bool { get }
    
    func getHashFromUser(password: String) -> (String)
}

extension IdentificationProtocol {
    func getHash(_ password: String) -> String {
        let inputData = Data(password.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap { String(format: "%02x", $0) }.joined()
        return hashString
    }
}
