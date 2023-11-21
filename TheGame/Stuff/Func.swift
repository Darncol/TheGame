//
//  Func.swift
//  TheGame
//
//  Created by Alexey Solop on 08.11.2023.
//

import Foundation
import CryptoKit
import UIKit

func sha256Hash(from input: String) -> String {
    let inputData = Data(input.utf8)
    let hashedData = SHA256.hash(data: inputData)
    let hashString = hashedData.compactMap { String(format: "%02x", $0) }.joined()
    return hashString
}
