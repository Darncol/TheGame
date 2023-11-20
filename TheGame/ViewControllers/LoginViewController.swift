//
//  ViewController.swift
//  TheGame
//
//  Created by Alexey Solop on 08.11.2023.
//

import UIKit
import RealmSwift


final class LoginViewController: UIViewController {
    
    let realm = RealmService()
    
    @IBOutlet weak var loginTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTF.delegate = self
        passwordTF.delegate = self
    }
    
 
    @IBAction func enterButtonTapped() {
        guard let login = loginTF.text, let password = passwordTF.text else { return }
        
        if !login.isEmpty && !password.isEmpty {
            let securedPassword = sha256Hash(from: password)
            
            if let player = realm.loadPlayer(name: login), player.password == securedPassword {
                performSegue(withIdentifier: "access", sender: nil)
            } else {
                showAlert(for: "☠️", and: "Неправильный ник или пароль!")
            }
        } else {
            showAlert(for: "☠️", and: "Заполните все поля!")
        }
        
    }
    
    
    @IBAction func createNewPlayerButtonTapped() {
        guard let login = loginTF.text, let password = passwordTF.text else { return }
        
        if !login.isEmpty && !password.isEmpty {
            let securedPassword = sha256Hash(from: password)
            
            if realm.doesPlayerExist(name: login) {
                showAlert(for: "Сорян", and: "Такой игрок уже существует")
            } else {
                let player = Player(name: login, password: securedPassword, coordinates: (0, 0))
            print(player.password)
                realm.savePlayer(player)
                performSegue(withIdentifier: "access", sender: nil)
            }
        }
    }
}

extension LoginViewController {
    private func showAlert(for titile: String, and message: String) {
        let alert = UIAlertController(title: titile, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "access",
                  let destinationVC = segue.destination as? UITabBarController,
                  let navController = destinationVC.viewControllers?.last as? UINavigationController,
                  let mapVC = navController.topViewController as? MapTableViewController,
                  let playerName = loginTF.text else {
                return
            }

            mapVC.playerName = playerName
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
