//
//  Result.swift
//  QuizEngine
//
//  Created by paige shin on 2022/06/28.
//

import Foundation

public struct Result<Question: Hashable, Answer> {
    public let answers: [Question: Answer]
    public let score: Int
    public init(answers: [Question: Answer], score: Int) {
        self.answers = answers
        self.score = score
    }
}
