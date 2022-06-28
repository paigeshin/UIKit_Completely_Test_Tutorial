//
//  Router.swift
//  QuizEngine
//
//  Created by paige shin on 2022/06/28.
//

import Foundation

protocol Router {
    associatedtype Question: Hashable
    associatedtype Answer
    func routeTo(question: Question, answerCallback: @escaping (Answer) -> Void)
    func routeTo(result: Result<Question, Answer>)
}
