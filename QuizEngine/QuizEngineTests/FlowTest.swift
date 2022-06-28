//
//  FlowTest.swift
//  QuizEngineTests
//
//  Created by paige shin on 2022/06/23.
//

import Foundation
import XCTest
@testable import QuizEngine

class FlowTest: XCTestCase {
    
    let router = RouterSpy()
        
    // go to result
    // sut = system under test
    func test_start_withNoQuestions_doesNotRouteToQuestion() {
        makeSUT(questions: []).start()
        XCTAssertTrue(router.routedQuestions.isEmpty)
    }
    
    func test_start_withOneQuestion_routesToCorrectQuestion() {
        makeSUT(questions: ["Q1"]).start()
        XCTAssertEqual(router.routedQuestions, ["Q1"])
    }
    
    func test_start_withOneQuestion_routesToCorrectQuestion_2() {
        makeSUT(questions: ["Q2"]).start()
        XCTAssertEqual(router.routedQuestions, ["Q2"])
    }
    
    func test_start_withTwoQuestions_routesToFirstQuestion() {
        makeSUT(questions: ["Q1", "Q2"]).start()
        XCTAssertEqual(router.routedQuestions, ["Q1"])
    }
    
    func test_startTwice_withTwoQuestions_routesToFirstQuestionTwice() {
        let sut = makeSUT(questions: ["Q1", "Q2"])
        sut.start()
        sut.start()
        XCTAssertEqual(router.routedQuestions, ["Q1", "Q1"])
    }
    
    func test_startAndAnswerFirstAndSecondQuestion_withThreeQuestions_routesToThirdQuestion() {
        let sut = makeSUT(questions: ["Q1", "Q2", "Q3"])
        sut.start()
        router.answerCallback("A1")
        router.answerCallback("A2")
        XCTAssertEqual(router.routedQuestions, ["Q1", "Q2", "Q3"])
    }
    
    func test_startAndAnswerFirstQuestion_withOneQuestion_doesNotRouteToAnotherQuestion() {
        let sut = makeSUT(questions: ["Q1"])
        sut.start()
        router.answerCallback("A1")
        XCTAssertEqual(router.routedQuestions, ["Q1"])
    }
    
    func test_start_withNoQuestions_routesToResult() {
        makeSUT(questions: []).start()
        XCTAssertEqual(router.routedResult!, [:])
    }
    
    func test_startAndAnswerFirstQueestion_withOneQuestion_routesToResult() {
        let sut = makeSUT(questions: ["Q1"])
        sut.start()
        router.answerCallback("A1")
        XCTAssertEqual(router.routedResult, ["Q1":"A1"])
    }
    
    func test_start_withOneQuestion_deosNotRouteToResult() {
        makeSUT(questions: ["Q1"]).start()
        XCTAssertNil(router.routedResult)
    }
    
    func test_startAnswerFirstQuestion_withTwoQuestions_doesNotRouteToResult() {
        let sut = makeSUT(questions: ["Q1", "Q2"])
        sut.start()
        router.answerCallback("A1")
        XCTAssertNil(router.routedResult)
    }
    
    func test_startAndAnswerFirstAndSecondQuestion_withTwoQuestions_routesToResult() {
        let sut = makeSUT(questions: ["Q1", "Q2"])
        sut.start()
        router.answerCallback("A1")
        router.answerCallback("A2")
        XCTAssertEqual(router.routedResult, ["Q1":"A1", "Q2":"A2"])
    }
    
    // MARK: Helpers - You can make it a separate file
    func makeSUT(questions: [String]) -> Flow<String, String, RouterSpy> {
        return Flow(questions: questions, router: router)
    }
    
    class RouterSpy: Router {

        var routedQuestions: [String] = []
        var answerCallback: (Answer) -> Void = { _ in }
        var routedResult: [String: String]? = nil
        
        func routeTo(question: String, answerCallback: @escaping (String) -> Void) {
            routedQuestions.append(question)
            self.answerCallback = answerCallback
        }
        
        func routeTo(result: [String : String]) {
            routedResult = result
        }
        
        
    }
    
}
