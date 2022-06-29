//
//  iOSViewControllerFactory.swift
//  QuizAppTests
//
//  Created by paige shin on 2022/06/29.
//

import Foundation
import XCTest
@testable import QuizApp

class iOSViewControlelrFactoryTeset: XCTestCase {
    
    func test_questionViewController_createsControllerWithQuestion() {
        let question = Question.singleAnswer("Q1")
        let options = ["A1", "A2"]
        let sut = iOSViewControlellerFactory(options: [question: options])
        let controller = sut.questionViewController(for: question, answerCallback: { _ in }) as! QuestionViewController
        XCTAssertEqual(controller.question, "Q1")
    }
    
    func test_questionViewController_createsControllerWithOptions() {
        let question = Question.singleAnswer("Q1")
        let options = ["A1", "A2"]
        let sut = iOSViewControlellerFactory(options: [question: options])
        let controller = sut.questionViewController(for: question, answerCallback: { _ in }) as! QuestionViewController
        XCTAssertEqual(controller.question, "Q1")
    }
    
    
}
