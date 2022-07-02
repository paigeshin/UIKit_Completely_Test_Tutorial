//
//  QuestionPresenter.swift
//  QuizApp
//
//  Created by paige shin on 2022/07/02.
//

import Foundation

struct QuestionPresenter {
    let questions: [Question<String>]
    let question: Question<String>
    
    var title: String {
        guard let index = questions.index(of: question) else { return "" }
        return "Question #\(index + 1)"
    }
}
