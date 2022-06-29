//
//  ResultsPresenterTest.swift
//  QuizAppTests
//
//  Created by paige shin on 2022/06/30.
//

import XCTest
import QuizEngine
@testable import QuizApp

class ResultsPresenterTest: XCTestCase {
    
    func test_summary_withTwoQuestionsAndScoreOne_returnSummary() {
        let answers = [
            Question.singleAnswer("Q1"):["A1"],
            Question.multipleAnswer("Q2"):["A2", "A3"]
        ]
        let result = Result(answers: answers, score: 1)
        let sut = ResultsPresenter(result: result, correctAnswers: [:])
        XCTAssertEqual(sut.summary, "You got 1/2 correct")
    }
    
    func test_summary_withThreeQuestionsAndScoreTwo_returnsSummary() {
        let answers = [
            Question.singleAnswer("Q1"):["A1"],
            Question.multipleAnswer("Q2"):["A2"],
            Question.multipleAnswer("Q3"):["A3"],
        ]
        let result = Result(answers: answers, score: 2)
        let sut = ResultsPresenter(result: result, correctAnswers: [:])
        XCTAssertEqual(sut.summary, "You got 2/3 correct")
    }
    
    func test_presentableAnswers_withoutQuestions_isEmpty() {
        let answers = Dictionary<Question<String>, [String]>()
        let result = Result(answers: answers, score: 0)
        let sut = ResultsPresenter(result: result, correctAnswers: [:])
        XCTAssertTrue(sut.presentableAnswers.isEmpty)
    }
    
    func test_presentableAnswers_withWrongSingleAnswer_mapsAnswer() {
        let answers = [Question.singleAnswer("Q1"): ["A1"]]
        let correctAnswers = [Question.singleAnswer("Q1"):["A2"]]
        let result = Result(answers: answers, score: 0)
        let sut = ResultsPresenter(result: result, correctAnswers: correctAnswers)
        XCTAssertEqual(sut.presentableAnswers.count, 1)
        XCTAssertEqual(sut.presentableAnswers.first!.question, "Q1")
        XCTAssertEqual(sut.presentableAnswers.first!.answer, "A2")
        XCTAssertEqual(sut.presentableAnswers.first!.wrongAnswer, "A1")
    }
    
    func test_presentableAnswers_withWrongMultipleAnswer_mapsAnswer() {
        let answers = [Question.multipleAnswer("Q1"): ["A1", "A4"]]
        let correctAnswers = [Question.multipleAnswer("Q1"):["A2", "A3"]]
        let result = Result(answers: answers, score: 0)
        let sut = ResultsPresenter(result: result, correctAnswers: correctAnswers)
        XCTAssertEqual(sut.presentableAnswers.count, 1)
        XCTAssertEqual(sut.presentableAnswers.first!.question, "Q1")
        XCTAssertEqual(sut.presentableAnswers.first!.answer, "A2, A3")
        XCTAssertEqual(sut.presentableAnswers.first!.wrongAnswer, "A1, A4")
    }
    
    func test_presentableAnswers_withRightSingleeAnswer_mapsAnswer() {
        let answers = [Question.singleAnswer("Q1"): ["A1"]]
        let correctAnswers = [Question.singleAnswer("Q1"):["A1"]]
        let result = Result(answers: answers, score: 1)
        let sut = ResultsPresenter(result: result, correctAnswers: correctAnswers)
        XCTAssertEqual(sut.presentableAnswers.count, 1)
        XCTAssertEqual(sut.presentableAnswers.first!.question, "Q1")
        XCTAssertEqual(sut.presentableAnswers.first!.answer, "A1")
        XCTAssertNil(sut.presentableAnswers.first!.wrongAnswer)
    }
 
    func test_presentableAnswers_withRightMultipleAnswer_mapsAnswer() {
        let answers = [Question.multipleAnswer("Q1"): ["A1", "A4"]]
        let correctAnswers = [Question.multipleAnswer("Q1"):["A1", "A4"]]
        let result = Result(answers: answers, score: 0)
        let sut = ResultsPresenter(result: result, correctAnswers: correctAnswers)
        XCTAssertEqual(sut.presentableAnswers.count, 1)
        XCTAssertEqual(sut.presentableAnswers.first!.question, "Q1")
        XCTAssertEqual(sut.presentableAnswers.first!.answer, "A1, A4")
        XCTAssertNil(sut.presentableAnswers.first!.wrongAnswer)
    }
    
}
