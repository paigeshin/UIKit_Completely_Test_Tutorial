//
//  Result.swift
//  QuizEngine
//
//  Created by paige shin on 2022/06/28.
//

import Foundation

public struct Result<Question: Hashable, Answer> {
    let answers: [Question: Answer]
    let score: Int
}
