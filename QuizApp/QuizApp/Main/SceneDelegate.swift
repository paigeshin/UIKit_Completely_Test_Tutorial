//
//  SceneDelegate.swift
//  QuizApp
//
//  Created by paige shin on 2022/06/28.
//

import UIKit
import QuizEngine

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var game: Game<Question<String>, [String], NaviationControllerRouter>?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window?.windowScene = scene

        let question = Question.singleAnswer("What's Mike's nationality?")
        let question2 = Question.multipleAnswer("What are Caio's nationalities?")
        let questions = [question, question2]
        
        let option1 = "Canadian"
        let option2 = "American"
        let option3 = "Greek"
        let options = [option1, option2, option3]
        
        let option4 = "Portugues"
        let option5 = "American"
        let option6 = "Brizilian"
        let options2 = [option4, option5, option6]
        
        let correctAnswers = [question: [option3], question2: [option4, option6]]
        let navigationController = UINavigationController()
        let factory = iOSViewControlellerFactory(
            questions: questions,
            options: [question: options, question2: options2],
            correctAnswers: correctAnswers
        )
        let router = NaviationControllerRouter(navigationController, factory: factory)
        game = startGame(questions: questions, router: router, correctAnswers: correctAnswers)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        
    }
    
}
