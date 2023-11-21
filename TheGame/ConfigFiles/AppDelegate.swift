//
//  AppDelegate.swift
//  TheGame
//
//  Created by Alexey Solop on 08.11.2023.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // MARK:  Настройка конфигурации Realm
        let config = Realm.Configuration(
            // Установите новую версию схемы. Это должно быть число больше, чем предыдущая версия
            // (если вы никогда не устанавливали версию схемы, то первоначальная версия равна 0).
            schemaVersion: 1,
            
            // Установите блок миграции. Это блок будет вызываться автоматически при открытии
            // Realm с более старой версией схемы, чем заданная выше.
            migrationBlock: { migration, oldSchemaVersion in
                // Мы пока не используем миграцию, но вы можете реализовать ее здесь,
                // если нужно выполнить миграцию при изменении схемы.
                if (oldSchemaVersion < 1) {
                    // Ничего не делаем, так как мы добавляем новое свойство, которое автоматически обрабатывается
                }
            }
        )
        
        // Устанавливаем новую конфигурацию как конфигурацию по умолчанию
        Realm.Configuration.defaultConfiguration = config
        
        // Теперь мы можем открывать Realm без дополнительных настроек
        let _ = try! Realm()
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

