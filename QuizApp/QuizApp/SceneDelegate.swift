//
//  SceneDelegate.swift
//  QuizApp
//
//  Created by paige shin on 2022/06/28.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window?.windowScene = scene
        let viewController = QuestionViewController(question: "A question?", options: ["Option 1", "Option 2"]) {
            print($0)
        }
        _ = viewController.view // view did load
//        viewController.tableView.allowsMultipleSelection = true
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
    
}
