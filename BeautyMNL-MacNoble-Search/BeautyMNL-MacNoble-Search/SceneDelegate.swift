//
//  SceneDelegate.swift
//  BeautyMNL-MacNoble-Search
//
//  Created by Mac Romel D. Noble on 8/1/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var mainCoordinator: SearchCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let navigationController = UINavigationController()
        
        let itunesCoordinator = ItunesMovieSearchCoordinator(navigationController)
        itunesCoordinator.start()
        mainCoordinator = itunesCoordinator
        
        window.rootViewController = navigationController
        
        self.window = window
        window.makeKeyAndVisible()
    }

}
