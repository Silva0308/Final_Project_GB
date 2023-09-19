//
//  SceneDelegate.swift
//  AirportTimetable
//
//  Created by MacBook Pro on 14/09/23.
//

import UIKit
//класс является отвечает за конфигурацию окна приложения
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    //метод делегата сцены, который вызывается при подключении сцены. В нем происходит конфигурация интерфейса приложения.
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let tabBarController = UITabBarController()
        let         departure = ScheduleViewController()
        let arrival = ScheduleViewController()
        
        departure.webURL = "https://api.rasp.yandex.net/v3.0/schedule/?apikey=49b09d58-6694-49ec-93a6-f4709fdcefd6&station=s9600366&transport_types=plane&event=departure"
        arrival.webURL = "https://api.rasp.yandex.net/v3.0/schedule/?apikey=49b09d58-6694-49ec-93a6-f4709fdcefd6&station=s9600366&transport_types=plane&event=arrival"
        
        let navigationDepartureVC = UINavigationController.init(rootViewController:         departure)
        let navigationArrivalVC = UINavigationController.init(rootViewController: arrival)
        
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

