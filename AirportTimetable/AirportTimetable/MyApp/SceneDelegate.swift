//
//  SceneDelegate.swift
//  AirportTimetable
//
//  Created by MacBook Pro on 14/09/23.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let tabBarController = UITabBarController()
        let departureVC = ScheduleViewController()
        let arrivalVC = ScheduleViewController()
        
        departureVC.webURL = "https://api.rasp.yandex.net/v3.0/schedule/?apikey=12661f47-954a-427c-bbde-97de19cd1fb9&station=s9600213&transport_types=plane&event=departure"
        arrivalVC.webURL = "https://api.rasp.yandex.net/v3.0/schedule/?apikey=12661f47-954a-427c-bbde-97de19cd1fb9&station=s9600213&transport_types=plane&event=arrival"
        
        let navigationDepartureVC = UINavigationController.init(rootViewController: departureVC)
        let navigationArrivalVC = UINavigationController.init(rootViewController: arrivalVC)
        
        tabBarController.overrideUserInterfaceStyle = .light
        tabBarController.tabBar.backgroundColor = .systemGray6
        
        navigationDepartureVC.title = "Departure"
        navigationDepartureVC.topViewController?.title = "Departure"
        navigationDepartureVC.navigationBar.prefersLargeTitles = true
        
        navigationArrivalVC.title = "Arrival"
        navigationArrivalVC.topViewController?.title = "Arrival"
        navigationArrivalVC.navigationBar.prefersLargeTitles = true
    
        tabBarController.viewControllers = [navigationDepartureVC, navigationArrivalVC]
        
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        window?.rootViewController = tabBarController
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {
 
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    
    }
}

