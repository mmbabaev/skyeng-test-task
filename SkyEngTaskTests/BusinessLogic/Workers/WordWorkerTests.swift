//
//  WordWorkerTests.swift
//  SkyEngTaskTests
//
//  Created by Mikhail on 28.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

@testable import SkyEngTask
import XCTest

class WordWorkerTests: XCTestCase {
    
    // MARK: - Mocks
    
    var service: WordServiceMock!
    
    // MARK: - SUT
    
    var worker: WordWorkerImp!
    
    // MARK: - setup

    override func setUp() {
        
        service = .init()
        
        worker = WordWorkerImp(service: service)
    }
    
    override func tearDown() {
        super.tearDown()
        
        service = nil
        worker = nil
    }
    
    // MARK: - loadNextPage

    func testLoadNextPage_success() {
        // Given
        let promise = expectation(description: #function)
        let request = NetworkRequestMock()
        worker.currentRequest = request
        let oldPage = 2
        worker.currentPage = oldPage
        let expectedPage = 3
        let expectedSearch = "search text"

        setupLoadNextPageServicePageSize()
        
        // When
        worker.loadNextPage(search: expectedSearch) { result in
            
            // Then
            let args = self.service.searchPagePageSizeCallbackReceivedArguments
            XCTAssertEqual(args?.page, oldPage)
            XCTAssertEqual(args?.search, expectedSearch)
            XCTAssertEqual(self.worker.currentPage, expectedPage)
            XCTAssertNotNil(self.worker.currentRequest)
            XCTAssert(request.cancelRequestCalled)
            
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: timeout)
    }
    
    func testLoadNextPage_fail() {
        // Given
        let promise = expectation(description: #function)
        
        worker.currentPage = 2
        let expectedPage = 2
        let expectedError = AppError.network
        setupLoadNextPageService(.failure(expectedError))
        
        // When
        worker.loadNextPage(search: Arbitrary.string) { result in
            
            // Then
            XCTAssertEqual(result.error, expectedError)
            XCTAssertEqual(self.worker.currentPage, expectedPage)
            
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: timeout)
    }
    
    func testLoadNextPage_isEnded() {
        // Given
        let expectedError = AppError.cancelled
        let promise = expectation(description: #function)
        worker.canLoadMore = false
        
        // When
        worker.loadNextPage(search: Arbitrary.string) { result in
            
            // Then
            XCTAssertEqual(expectedError, result.error)
            XCTAssertFalse(self.service.searchPagePageSizeCallbackCalled)
            XCTAssertNil(self.worker.currentRequest)
            
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: timeout)
    }
    
    func testLoadNextPage_setCanLoadMore() {
        // Given
        let promise = expectation(description: #function)
        worker.canLoadMore = true
        setupLoadNextPageService(.success([Arbitrary.word]))
        
        // When
        worker.loadNextPage(search: Arbitrary.string) { result in
            
            // Then
            XCTAssertFalse(self.worker.canLoadMore)
            
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: timeout)
    }
    
    // MARK: - reset
    
    func testReset() {
        // Given
        let expectedPage = 0
        worker.currentPage = 100500
        worker.canLoadMore = false
        
        // When
        worker.reset()
        
        // Then
        XCTAssertEqual(worker.currentPage, expectedPage)
        XCTAssert(worker.canLoadMore)
    }
}

// MARK: - Private

private extension WordWorkerTests {
    
    var timeout: TimeInterval {
        return 3
    }
    
    func setupLoadNextPageServicePageSize() {
        let words = Array(repeating: Arbitrary.word, count: worker.pageSize)
        setupLoadNextPageService(.success(words))
    }
    
    func setupLoadNextPageService(_ result: Result<[Word]>) {
        
        service.searchPagePageSizeCallbackClosure = { _, _, _, callback in
            callback(result)
            return NetworkRequestMock()
        }
    }
}
