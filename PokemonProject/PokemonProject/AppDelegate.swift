//
//  AppDelegate.swift
//  PokemonProject
//
//  Created by Luis Domingues on 07/03/20.
//  Copyright © 2020 Luis Domingues. All rights reserved.
//

import UIKit
import RealmSwift

let baseUrl = "https://pokeapi.co/api/v2/pokemon"
var uiRealm: Realm!

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let nc = UINavigationController()
        let mainView = ViewController(nibName: nil, bundle: nil)

        mainView.view.backgroundColor = .white
        nc.viewControllers = [mainView]
        nc.navigationBar.isTranslucent = false
        nc.view.tintColor = .white

        UINavigationBar.appearance().tintColor = .white
        self.window!.rootViewController = nc

        self.window?.makeKeyAndVisible()

    
        do {
            try uiRealm = Realm()
        } catch {
            print("Realm error")
        }
        
        print("DOCUMENTS: ", Realm.Configuration.defaultConfiguration.fileURL ?? "")

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

