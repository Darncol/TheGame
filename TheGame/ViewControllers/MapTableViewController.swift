//
//  MapTableViewController.swift
//  TheGame
//
//  Created by Alexey Solop on 16.11.2023.
//

import UIKit

final class MapTableViewController: UITableViewController {
    
    @IBOutlet var mapButtons: [UIButton]!
    
    let realm = RealmService()
    
    private let map = [
        [1,2,3],
        [4,5,6],
        [7,8,9],
        [10,11,12]
    ]
    
    private var player: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let id = AuthenticationStore.shared.id {
            player = realm.loadPlayer(id: id)
        }
        configureButtonBorders()
        updatePlayerLocation()
        
    }
    
    
    @IBAction func updatePositionButton(_ sender: UIButton) {
        movePlayerToPosition(sender.tag)
            updatePlayerLocation()
    }
}

// MARK: Map methods
extension MapTableViewController {
    private func configureButtonBorders() {
        for button in mapButtons {
            button.layer.borderWidth = 1
        }
    }
    
    private func updatePlayerLocation() {
        guard let player = player else { return }
        
        removeImagesFromButtons()
        
        let index = map[player.coordinates.y][player.coordinates.x]
        mapButtons[index - 1].setImage(UIImage(systemName: "arrowshape.down.fill"), for: .normal)
    }
    
    private func removeImagesFromButtons() {
        for image in mapButtons {
            image.setImage(nil, for: .normal)
        }
    }
    
    private func movePlayerToPosition(_ position: Int) {
        guard let player = player else { return }
        
        player.moveToNew(destination: position)
        realm.savePlayer(player)
    }
}
