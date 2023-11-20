//
//  MapTableViewController.swift
//  TheGame
//
//  Created by Alexey Solop on 16.11.2023.
//

import UIKit

class MapTableViewController: UITableViewController {
    
    @IBOutlet var mapButtons: [UIButton]!
    
    private let map = [
        [1,2,3],
        [4,5,6],
        [7,8,9],
        [10,11,12]
    ]
    
    let player = Player(name: "Test", coordinates: (1,2))

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        player.moveToNew(destination: position)
        
    }
}
