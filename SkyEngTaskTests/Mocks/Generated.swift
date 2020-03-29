// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif














class NetworkRequestMock: NetworkRequest {

    //MARK: - cancelRequest

    var cancelRequestCallsCount = 0
    var cancelRequestCalled: Bool {
        return cancelRequestCallsCount > 0
    }
    var cancelRequestClosure: (() -> Void)?

    func cancelRequest() {
        cancelRequestCallsCount += 1
        cancelRequestClosure?()
    }

}
class TranslateRouterMock: TranslateRouter {

    //MARK: - routeToWord

    var routeToWordCallsCount = 0
    var routeToWordCalled: Bool {
        return routeToWordCallsCount > 0
    }
    var routeToWordReceivedWord: Word?
    var routeToWordReceivedInvocations: [Word] = []
    var routeToWordClosure: ((Word) -> Void)?

    func routeToWord(_ word: Word) {
        routeToWordCallsCount += 1
        routeToWordReceivedWord = word
        routeToWordReceivedInvocations.append(word)
        routeToWordClosure?(word)
    }

}
class TranslateViewMock: TranslateView {

    //MARK: - displayCells

    var displayCellsCallsCount = 0
    var displayCellsCalled: Bool {
        return displayCellsCallsCount > 0
    }
    var displayCellsReceivedCellModels: [WordCellViewModel]?
    var displayCellsReceivedInvocations: [[WordCellViewModel]] = []
    var displayCellsClosure: (([WordCellViewModel]) -> Void)?

    func displayCells(_ cellModels: [WordCellViewModel]) {
        displayCellsCallsCount += 1
        displayCellsReceivedCellModels = cellModels
        displayCellsReceivedInvocations.append(cellModels)
        displayCellsClosure?(cellModels)
    }

    //MARK: - displayError

    var displayErrorCallsCount = 0
    var displayErrorCalled: Bool {
        return displayErrorCallsCount > 0
    }
    var displayErrorClosure: (() -> Void)?

    func displayError() {
        displayErrorCallsCount += 1
        displayErrorClosure?()
    }

    //MARK: - endLoading

    var endLoadingCallsCount = 0
    var endLoadingCalled: Bool {
        return endLoadingCallsCount > 0
    }
    var endLoadingClosure: (() -> Void)?

    func endLoading() {
        endLoadingCallsCount += 1
        endLoadingClosure?()
    }

}
class WordServiceMock: WordService {

    //MARK: - search

    var searchPagePageSizeCallbackCallsCount = 0
    var searchPagePageSizeCallbackCalled: Bool {
        return searchPagePageSizeCallbackCallsCount > 0
    }
    var searchPagePageSizeCallbackReceivedArguments: (search: String, page: Int, pageSize: Int, callback: ResultCallback<[Word]>)?
    var searchPagePageSizeCallbackReceivedInvocations: [(search: String, page: Int, pageSize: Int, callback: ResultCallback<[Word]>)] = []
    var searchPagePageSizeCallbackReturnValue: NetworkRequest?
    var searchPagePageSizeCallbackClosure: ((String, Int, Int, @escaping ResultCallback<[Word]>) -> NetworkRequest?)?

    func search(_ search: String,                page: Int,                pageSize: Int,                callback: @escaping ResultCallback<[Word]>) -> NetworkRequest? {
        searchPagePageSizeCallbackCallsCount += 1
        searchPagePageSizeCallbackReceivedArguments = (search: search, page: page, pageSize: pageSize, callback: callback)
        searchPagePageSizeCallbackReceivedInvocations.append((search: search, page: page, pageSize: pageSize, callback: callback))
        return searchPagePageSizeCallbackClosure.map({ $0(search, page, pageSize, callback) }) ?? searchPagePageSizeCallbackReturnValue
    }

}
class WordWorkerMock: WordWorker {

    //MARK: - loadNextPage

    var loadNextPageSearchCallbackCallsCount = 0
    var loadNextPageSearchCallbackCalled: Bool {
        return loadNextPageSearchCallbackCallsCount > 0
    }
    var loadNextPageSearchCallbackReceivedArguments: (search: String, callback: ResultCallback<[Word]>)?
    var loadNextPageSearchCallbackReceivedInvocations: [(search: String, callback: ResultCallback<[Word]>)] = []
    var loadNextPageSearchCallbackClosure: ((String, @escaping ResultCallback<[Word]>) -> Void)?

    func loadNextPage(search: String, callback: @escaping ResultCallback<[Word]>) {
        loadNextPageSearchCallbackCallsCount += 1
        loadNextPageSearchCallbackReceivedArguments = (search: search, callback: callback)
        loadNextPageSearchCallbackReceivedInvocations.append((search: search, callback: callback))
        loadNextPageSearchCallbackClosure?(search, callback)
    }

    //MARK: - reset

    var resetCallsCount = 0
    var resetCalled: Bool {
        return resetCallsCount > 0
    }
    var resetClosure: (() -> Void)?

    func reset() {
        resetCallsCount += 1
        resetClosure?()
    }

}
@testable import SkyEngTask
