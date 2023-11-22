//
//  PlayerInfoTableViewController.swift
//  TheGame
//
//  Created by Alexey Solop on 09.11.2023.
//

import UIKit

final class StatusTableViewController: UITableViewController {
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationImage: UIImageView!
    
    private let realm = RealmService()
    
    private var player: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePlayerData()
        updatePlayerLocation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updatePlayerData()
        updatePlayerLocation()
    }
}

// MARK: - Player Data Management
extension StatusTableViewController {
    private func updatePlayerLocation() {
        guard let player = player else { return }
        
        locationLabel.text = Map.shared.getLocationName(byCoordinates: player.coordinates)
        locationImage.image = UIImage(named: Map.shared.getIndex(fromY: player.coordinates.y, andX: player.coordinates.x).description)
    }
    
    private func updatePlayerData() {
        if let id = AuthenticationStore.shared.id {
            player = realm.loadPlayer(id: id)
        }
    }
}
