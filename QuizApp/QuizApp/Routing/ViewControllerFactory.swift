//
//  ViewControllerFactory.swift
//  QuizApp
//
//  Created by paige shin on 2022/06/29.
//

import UIKit
import QuizEngine

protocol ViewControllerFactory {
    func questionViewController(for question: Question<String>, answerCallback: @escaping ([String]) -> Void) -> UIViewController
    func resultsViewController(for result: Result<Question<String>, [String]>) -> UIViewController
}
