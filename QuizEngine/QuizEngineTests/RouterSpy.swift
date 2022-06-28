//
//  RouterSpu.swift
//  QuizEngineTests
//
//  Created by paige shin on 2022/06/28.
//

import Foundation
@testable import QuizEngine

class RouterSpy: Router {

    var routedQuestions: [String] = []
    var answerCallback: (Answer) -> Void = { _ in }
    var routedResult: Result<String, String>? = nil
    
    func routeTo(question: String, answerCallback: @escaping (String) -> Void) {
        routedQuestions.append(question)
        self.answerCallback = answerCallback
    }
    
    func routeTo(result: Result<String, String>) {
        routedResult = result
    }
    
    
}
