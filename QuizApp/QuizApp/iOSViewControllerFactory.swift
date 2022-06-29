//
//  iOSViewControllerFactory.swift
//  QuizApp
//
//  Created by paige shin on 2022/06/29.
//

import UIKit
import QuizEngine

class iOSViewControlellerFactory: ViewControllerFactory {

    private let options: Dictionary<Question<String>, [String]>
    
    init(options: Dictionary<Question<String>, [String]>) {
        self.options = options
    }
    
    func questionViewController(for question: Question<String>, answerCallback: @escaping ([String]) -> Void) -> UIViewController {
        switch question {
        case .singleAnswer(let value):
            return QuestionViewController(question: value, options: options[question]!, selection: answerCallback)
            default: return UIViewController()
        }
    }
    
    func resultsViewController(for result: Result<Question<String>, [String]>) -> UIViewController {
        return UIViewController()
    }
    
}
