//
//  TranslatePresenterTests.swift
//  SkyEngTaskTests
//
//  Created by Mihail on 30.03.2020.
//  Copyright © 2020 Mihail. All rights reserved.
//

@testable import SkyEngTask

import XCTest

class TranslatePresenterTests: XCTestCase {
    
    // MARK: - Mocks
    
    var view: TranslateViewMock!
    var router: TranslateRouterMock!
    var worker: WordWorkerMock!
    
    // MARK: - SUT
    
    var presenter: TranslatePresenterImp!
    
    // MARK: - setup

    override func setUp() {
        
        view = .init()
        router = .init()
        worker = .init()
        
        presenter = TranslatePresenterImp(
            view: view,
            router: router,
            worker: worker
        )
    }
    
    override func tearDown() {
        view = nil
        router = nil
        worker = nil
        presenter = nil
    }
    
    // MARK: - Refresh
    
    func testRefresh() {
        // Given
        let expectedText = Arbitrary.string
        presenter.words = Array(repeating: Arbitrary.word, count: 5)
        
        // When
        presenter.refresh(text: expectedText)
        
        // Then
        XCTAssert(worker.resetCalled)
        XCTAssert(presenter.words.isEmpty)
        let receivedText = worker.loadNextPageSearchCallbackReceivedArguments?.search
        XCTAssertEqual(expectedText, receivedText)
    }
    
    // MARK: - LoadNextPage
    
    func testLoadMore_success() {
        // Given
        let expectedText = Arbitrary.string
        let expectedCount = 5
        let expectedWords = Array(repeating: Arbitrary.word, count: expectedCount)
        setupLoadNextPageResult(.success(expectedWords))
        
        // When
        presenter.loadMore(text: expectedText)
        
        // Then
        let receivedText = worker.loadNextPageSearchCallbackReceivedArguments?.search
        XCTAssertEqual(expectedText, receivedText)
        
        let receivedCount = view.displayCellsReceivedCellModels?.count
        XCTAssertEqual(receivedCount, expectedCount)
        
        XCTAssert(view.endLoadingCalled)
    }
    
    func testLoadMore_cancelError() {
        // Given
        let error = AppError.cancelled
        setupLoadNextPageResult(.failure(error))
        
        // When
        presenter.loadMore(text: Arbitrary.string)
        
        // Then
        XCTAssert(worker.loadNextPageSearchCallbackCalled)
        XCTAssert(view.endLoadingCalled)
        XCTAssertFalse(view.displayCellsCalled)
        XCTAssertFalse(view.displayErrorCalled)
    }
    
    func testLoadMore_otherError() {
        // Given
        let expectedError = AppError.network
        setupLoadNextPageResult(.failure(expectedError))
        
        // When
        presenter.loadMore(text: Arbitrary.string)
        
        // Then
        XCTAssert(worker.loadNextPageSearchCallbackCalled)
        XCTAssert(view.endLoadingCalled)
        XCTAssert(view.displayErrorCalled)
        XCTAssertFalse(view.displayCellsCalled)
    }
    
    // MARK: - selectWord
    
    func testSelectWord_success() {
        // Given
        let index = 2
        let expectedId = 999
        let expectedWord = Word(id: expectedId, text: Arbitrary.string, meanings: [])
        presenter.words = [Arbitrary.word, Arbitrary.word, expectedWord]
        
        // When
        presenter.selectWord(at: index)
        
        // Then
        let receivedWordId = router.routeToWordReceivedWord?.id
        XCTAssertEqual(expectedId, receivedWordId)
    }
    
    func testSelectWord_fail() {
        // Given
        let index = Arbitrary.int
        presenter.words = []
        
        // When
        presenter.selectWord(at: index)
        
        // Then
        XCTAssertFalse(router.routeToWordCalled)
    }
}

// MARK: - Private

private extension TranslatePresenterTests {
    
    func setupLoadNextPageSuccess() {
        let words = Array(repeating: Arbitrary.word, count: Arbitrary.int)
        setupLoadNextPageResult(.success(words))
    }
    
    func setupLoadNextPageResult(_ result: Result<[Word]>) {
        worker.loadNextPageSearchCallbackClosure = { _, callback in
            callback(result)
        }
    }
}
