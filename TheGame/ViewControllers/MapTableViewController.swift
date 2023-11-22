//
//  MapTableViewController.swift
//  TheGame
//
//  Created by Alexey Solop on 16.11.2023.
//

import UIKit

final class MapTableViewController: UITableViewController {
    
    @IBOutlet var mapButtons: [UIButton]!
    
    let realmService = RealmService()
    
    private var player: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let id = AuthenticationStore.shared.id {
            player = realmService.loadPlayer(id: id)
        }
        
        configureButtonBorders()
        updatePlayerLocation()
        updateTitleLocation()
    }
    
    
    @IBAction func updatePositionButton(_ sender: UIButton) {
        movePlayer(to: sender.tag)
        updatePlayerLocation()
        updateTitleLocation()
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
        
        let index = Map.shared.getIndex(fromY: player.coordinates.y,andX: player.coordinates.x )
        mapButtons[index - 1].setImage(UIImage(systemName: "arrowshape.down.fill"), for: .normal)
    }
    
    private func updateTitleLocation() {
        guard let player = player else { return }
        self.title = Map.shared.getLocationName(byCoordinates: player.coordinates)
    }
    
    private func removeImagesFromButtons() {
        for image in mapButtons {
            image.setImage(nil, for: .normal)
        }
    }
    
    private func movePlayer(to position: Int) {
        guard let player = player else { return }
        
        player.moveToNew(destination: position)
        realmService.savePlayer(player)
    }
}
