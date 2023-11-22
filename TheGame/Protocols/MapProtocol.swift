//
//  File.swift
//  TheGame
//
//  Created by Alexey Solop on 22.11.2023.
//

import Foundation

protocol MapViewControllerDelegate: AnyObject {
    func playerDidMoveToNewPosition(_ player: Player)
}
