//
//  ResultsHelper.swift
//  QuizAppTests
//
//  Created by paige shin on 2022/06/29.
//

import QuizEngine

extension Result: Hashable {

    // Fake Hashable
    public var hashValue: Int {
        return 1
    }
    
    public static func ==(lhs: Result<Question, Answer>, rhs: Result<Question, Answer>) -> Bool {
        return lhs.score == rhs.score
    }
    
}
