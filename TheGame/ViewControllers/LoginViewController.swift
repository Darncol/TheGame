//
//  ViewController.swift
//  TheGame
//
//  Created by Alexey Solop on 08.11.2023.
//

import UIKit
import RealmSwift


final class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let realmService = RealmService()
    private lazy var authenticationManager = AuthenticationManager(realmService: realmService)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: Try login
    @IBAction func handleLogin() {
        guard let login = loginTextField.text, let password = passwordTextField.text,
                  validateCredentials(login: login, password: password) else {
                showAlert(with: "☠️", and: AuthenticationError.emptyFields.rawValue)
                return
            }

            if authenticationManager.authenticateUser(login: login, password: password) {
                performSegue(withIdentifier: SegueIdentifiers.accessGame, sender: nil)
            } else {
                showAlert(with: "☠️", and: AuthenticationError.invalidCredentials.rawValue)
            }
    }
    
    // MARK: Create new player
    @IBAction func handleNewPlayerCreation() {
        guard let login = loginTextField.text, let password = passwordTextField.text,
                 validateCredentials(login: login, password: password) else {
               showAlert(with: "☠️", and: AuthenticationError.emptyFields.rawValue)
               return
           }

           if authenticationManager.createNewPlayer(login: login, password: password) {
               performSegue(withIdentifier: SegueIdentifiers.accessGame, sender: nil)
           } else {
               showAlert(with: "Сорян", and: AuthenticationError.playerExists.rawValue)
           }
    }
}

// MARK: Additional features
extension LoginViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func validateCredentials(login: String, password: String) -> Bool {
        return !login.isEmpty && !password.isEmpty
    }
}

// MARK: TextFiled delegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: Error enums
extension LoginViewController {
    private enum AuthenticationError: String {
           case emptyFields = "Заполните все поля!"
           case invalidCredentials = "Неправильный ник или пароль!"
           case playerExists = "Такой игрок уже существует"
       }
}
