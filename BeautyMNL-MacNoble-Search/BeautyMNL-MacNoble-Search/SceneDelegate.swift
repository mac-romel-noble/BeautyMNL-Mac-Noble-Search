//
//  SceneDelegate.swift
//  BeautyMNL-MacNoble-Search
//
//  Created by Mac Romel D. Noble on 8/1/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let viewModel = ItunesSearchViewModel()
        let viewController = SearchTableViewController(viewModel)
        
        let navigation = UINavigationController(
            rootViewController: viewController
        )
        
        window.rootViewController = navigation
        
        self.window = window
        window.makeKeyAndVisible()
    }

}
