//
//  Flow.swift
//  QuizEngine
//
//  Created by paige shin on 2022/06/23.
//

import Foundation

protocol Router {
    func routeTo(question: String, answerCallback: @escaping(String) -> Void)
}

final class Flow {
    
    let router: Router
    let questions: [String]
    
    init(questions: [String], router: Router) {
        self.questions = questions
        self.router = router
    }
    
    func start() {
        if let firstQuestion = questions.first {
            router.routeTo(question: firstQuestion) { [weak self] _ in
                guard let strongSelf = self else { return }
                let firstQuestionIndex = strongSelf.questions.index(of: firstQuestion)!
                let nextQuestion = strongSelf.questions[firstQuestionIndex + 1]
                strongSelf.router.routeTo(question: nextQuestion) { _ in }
            }
        }
    }
    
}
