//
//  MapTableViewController.swift
//  TheGame
//
//  Created by Alexey Solop on 16.11.2023.
//

import UIKit

class MapTableViewController: UITableViewController {
    
    @IBOutlet var positionOutlets: [UIButton]!
    
    private let map = [
        [1,2,3],
        [4,5,6],
        [7,8,9],
        [10,11,12]
    ]
        
    var mapCoordinates = (y: 0, x: 0)
    
    let player = Player(name: "Test", coordinates: (1,2))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBorderForPositionOutlest()
        setPlayerLocationOnMap()
    }
    
    
    @IBAction func updatePositionButton(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            updatePlayerCoordinates(1)
            setPlayerLocationOnMap()
        case 2:
            updatePlayerCoordinates(2)
            setPlayerLocationOnMap()
        case 3:
            updatePlayerCoordinates(3)
            setPlayerLocationOnMap()
        case 4:
            updatePlayerCoordinates(4)
            setPlayerLocationOnMap()
        case 5:
            updatePlayerCoordinates(5)
            setPlayerLocationOnMap()
        case 6:
            updatePlayerCoordinates(6)
            setPlayerLocationOnMap()
        case 7:
            updatePlayerCoordinates(7)
            setPlayerLocationOnMap()
        case 8:
            updatePlayerCoordinates(8)
            setPlayerLocationOnMap()
        case 9:
            updatePlayerCoordinates(9)
            setPlayerLocationOnMap()
        case 10:
            updatePlayerCoordinates(10)
            setPlayerLocationOnMap()
        case 11:
            updatePlayerCoordinates(11)
            setPlayerLocationOnMap()
        default:
            updatePlayerCoordinates(12)
            setPlayerLocationOnMap()
            break
        }
    }
}

// MARK: Map methods
extension MapTableViewController {
    private func configureBorderForPositionOutlest() {
        for position in positionOutlets {
            position.layer.borderWidth = 1
        }
    }
    
    private func setPlayerLocationOnMap() {
        removeImgesFromButtons()
        let position = map[player.coordinates.y][player.coordinates.x]
        positionOutlets[position - 1].setImage(UIImage(systemName: "arrowshape.down.fill"), for: .normal)
    }
    
    private func removeImgesFromButtons() {
        for image in positionOutlets {
            image.setImage(nil, for: .normal)
        }
    }
    
    private func updatePlayerCoordinates(_ location: Int) {
        player.moveToNew(destination: location)
        
    }
}
