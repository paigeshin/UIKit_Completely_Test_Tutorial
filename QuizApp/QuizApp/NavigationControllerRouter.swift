//
//  NavigationControllerRouter.swift
//  QuizApp
//
//  Created by paige shin on 2022/06/29.
//

import QuizEngine
import UIKit

class NaviationControllerRouter: Router {
    
    private let navigationController: UINavigationController
    private let factory: ViewControllerFactory
    
    init(_ navigationController: UINavigationController, factory: ViewControllerFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func routeTo(question: Question<String>, answerCallback: @escaping ([String]) -> Void) {
        let viewController = factory.questionViewController(for: question, answerCallback: answerCallback)
        show(viewController)
    }
    
    func routeTo(result: Result<Question<String>, [String]>) {
        let viewController = factory.resultsViewController(for: result)
        show(viewController)
    }
    
    private func show(_ viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
