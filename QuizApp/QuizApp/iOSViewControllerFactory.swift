//
//  iOSViewControllerFactory.swift
//  QuizApp
//
//  Created by paige shin on 2022/06/29.
//

import UIKit
import QuizEngine

class iOSViewControlellerFactory: ViewControllerFactory {

    private let questions: [Question<String>]
    private let options: Dictionary<Question<String>, [String]>
    
    init(questions: [Question<String>],  options: Dictionary<Question<String>, [String]>) {
        self.questions = questions
        self.options = options
    }
    
    func questionViewController(for question: Question<String>,answerCallback answersCallback: @escaping([String]) -> Void) -> UIViewController {
        guard let options = self.options[question] else {
            fatalError("Couldn't find options for question: \(question)")
        }
        return questionViewController(for: question, options: options, answerCallback: answersCallback)
    }
    
    private func questionViewController(for question: Question<String>, options: [String], answerCallback: @escaping ([String]) -> Void) -> UIViewController {
        switch question {
        case .singleAnswer(let value):
            return questionViewController(for: question, value: value, options: options, answerCallback: answerCallback)
        case .multipleAnswer(let value):
            let controller = questionViewController(for: question, value: value, options: options, answerCallback: answerCallback)
            controller.title = "Question #2"
            _ = controller.view
            controller.tableView.allowsMultipleSelection = true
            return controller
        }
    }
    
    private func questionViewController(for question: Question<String>, value: String, options: [String], answerCallback: @escaping([String]) -> Void) -> QuestionViewController {
        let presenter = QuestionPresenter(questions: questions, question: question)
        let controller = QuestionViewController(question: value, options: options, selection: answerCallback)
        controller.title = presenter.title
        return controller
    }
    
    func resultsViewController(for result: Result<Question<String>, [String]>) -> UIViewController {
        return UIViewController()
    }
    
}
