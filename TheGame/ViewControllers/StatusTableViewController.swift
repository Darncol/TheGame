//
//  PlayerInfoTableViewController.swift
//  TheGame
//
//  Created by Alexey Solop on 09.11.2023.
//

import UIKit

final class StatusTableViewController: UITableViewController {
    
    private let realm = RealmService()
    
    private var player: Player?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let id = AuthenticationStore.shared.id {
            player = realm.loadPlayer(id: id)
        }
    }
}
