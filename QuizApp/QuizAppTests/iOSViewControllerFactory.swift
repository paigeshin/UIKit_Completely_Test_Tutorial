//
//  iOSViewControllerFactory.swift
//  QuizAppTests
//
//  Created by paige shin on 2022/06/29.
//

import UIKit
import Foundation
import XCTest
import QuizEngine
@testable import QuizApp

class iOSViewControlelrFactoryTeset: XCTestCase {
    
    let singleAnswerQuestion = Question.singleAnswer("Q1")
    let multipleAnswerQuestion = Question.multipleAnswer("Q1")
    let options = ["A1", "A2"]
    
    func test_questionViewController_singleAnswer_createsControllerWithTitle() {
        let presenter = QuestionPresenter(questions: [singleAnswerQuestion, multipleAnswerQuestion], question: singleAnswerQuestion)
        XCTAssertEqual(makeQuestionController(question: singleAnswerQuestion).title, presenter.title)
    }
    
    func test_questionViewController_singleAnswer_createsControllerWithQuestion() {
        XCTAssertEqual(makeQuestionController(question: singleAnswerQuestion).question, "Q1")
    }
    
    func test_questionViewController_singleAnswer_createsControllerWithOptions() {
        XCTAssertEqual(makeQuestionController(question: singleAnswerQuestion).options, options)
    }

    func test_questionViewController_singleAnswer_createsControllerWithSingleSelection() {
        let controller = makeQuestionController(question: singleAnswerQuestion)
        XCTAssertFalse(controller.allowsMultipleSelection)
    }
    
    func test_questionViewController_multipleAnswer_createsControllerWithTitle() {
        let presenter = QuestionPresenter(questions: [singleAnswerQuestion, multipleAnswerQuestion], question: multipleAnswerQuestion)
        XCTAssertEqual(makeQuestionController(question: multipleAnswerQuestion).title, presenter.title)
    }
    
    func test_questionViewController_mutipleAnswer_createsControllerWithQuestion() {
        XCTAssertEqual(makeQuestionController(question: multipleAnswerQuestion).question, "Q1")
    }
    
    func test_questionViewController_mutipleAnswer_createsControllerWithOptions() {
        XCTAssertEqual(makeQuestionController(question: multipleAnswerQuestion).options, options)
    }

    func test_questionViewController_mutipleAnswer_createsControllerWithSingleSelection() {
        let controller = makeQuestionController(question: .multipleAnswer("Q1"))
        XCTAssertTrue(controller.allowsMultipleSelection)
    }
    
    func test_resultsViewController_createsControllerWithPresentableAnswers() {
        let results = makeResults()
        XCTAssertEqual(results.controller.answers.count, results.presenter.presentableAnswers.count)
    }
    
    func test_resultsViewController_createsControllerWithSummary() {
        let results = makeResults()
        XCTAssertEqual(results.controller.summary, results.presenter.summary)
    }
    
    // MARK: Helpers
    
    func makeSUT(
        options: Dictionary<Question<String>, [String]> = [:],
        correctAnswers: Dictionary<Question<String>, [String]> = [:]) -> iOSViewControlellerFactory {
        return iOSViewControlellerFactory(questions: [singleAnswerQuestion, multipleAnswerQuestion], options: options, correctAnswers: correctAnswers)
    }
    
    func makeQuestionController(question: Question<String> = Question.singleAnswer("")) -> QuestionViewController {
        return makeSUT(options: [question: options]).questionViewController(for: question, answerCallback: { _ in }) as! QuestionViewController
    }
    
    func makeResults() -> (controller: ResultsViewController, presenter: ResultsPresenter) {
        let userAnswers = [
            singleAnswerQuestion: ["A1"],
            multipleAnswerQuestion: ["A1", "A2"]
        ]
        let correctAnswers = [
            singleAnswerQuestion: ["A1"],
            multipleAnswerQuestion: ["A1", "A2"]
        ]
        let questions = [
            singleAnswerQuestion,
            multipleAnswerQuestion
        ]
        let result = Result(answers: userAnswers, score: 2)
        let presenter = ResultsPresenter(result: result,
                                         questions: questions,
                                         correctAnswers: correctAnswers)
        let sut = makeSUT(correctAnswers: correctAnswers)
        let controller = sut.resultsViewController(for: result) as! ResultsViewController
        return (controller, presenter)
    }
    
}
